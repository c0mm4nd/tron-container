# Tron Container Deployment

Tron Container Deployment is a container for deploying tron protocal fullnode with services.

[中文版](./README.CHS.md)

## Usage

```bash
docker build . -t trondeploy
docker run -d \
  -p 5555:5555 \
  -p 8090:8090 \
  -p 8545:8545 \
  -p 50051:50051 \
  -p 18888:18888 \
  -p 18888:18888/udp \
  -v /path/to/your/data:/tron/output-directory \
  --name tron_fullnode \
  trondeploy
```

### Environment Variables

- `HEAP_SIZE`: JVM heap size (default: 8g)

## Details

Ports:
| port | service | required? | config location |
| --- | --- | --- | --- |
| 5555 | ZeroMQ/Event Plugin | optional for event streaming | enabled by plugins |
| 8090 | HTTP Restful API | yes for API access | node.http.fullNodePort | 
| 8091 | HTTP Restful API (solidity) | optional | node.http.solidityPort | 
| 8545 | HTTP JSON RPC | yes for Ethereum compatibility | node.jsonrpc.httpFullNodePort |
| 8555 | HTTP JSON RPC (solidity) | optional | node.jsonrpc.httpSolidityPort |
| 18888 | P2P | yes for node synchronization | node.listen.port |
| 50051 | gRPC | yes for gRPC access | node.rpc.port |
| 50061 | gRPC (solidity) | optional | node.rpc.solidityPort |

Files & Folders:
| folder | content |
| --- | --- |
| /tron | the root workspace directory |
| /tron/output-directory/ | blockchain data directory (>1.4TB) |
| /tron/logs/ | application logs directory |
| /tron/FullNode.jar | Tron fullnode executable JAR file |
| /tron/main_net_config.conf | main network configuration file |
| /tron/start.sh | container entry point script |
| /tron/downloader.sh | data initialization script |

## Configuration

The container uses `main_net_config.conf` for Tron mainnet configuration with the following key settings:

- **Database**: LevelDB engine with data stored in `output-directory`
- **Network**: Mainnet type with P2P listening on port 18888
- **APIs**: Multiple API endpoints enabled (HTTP REST, gRPC, JSON-RPC)
- **Memory**: JVM heap size configurable via `HEAP_SIZE` environment variable (default: 8g)

## Storage Recommendations

Highly recommend using [docker volumes](https://docs.docker.com/storage/volumes/) to mount `/tron` or `/tron/output-directory` to avoid data loss when restarting the container:

```bash
# Mount entire workspace
docker run -d -v tron_data:/tron ...

# Mount only blockchain data
docker run -d -v tron_blockchain:/tron/output-directory ...
```
