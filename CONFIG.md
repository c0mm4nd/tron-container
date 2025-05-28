# Configuration File Updates

Key modifications to `main_net_config.conf` and their purposes:

## Balance History Lookup
```
balance.history.lookup = true
```
**Purpose**: Enable balance history queries for better account tracking and historical analysis.

## Constant Support
```
supportConstant = true
```
**Purpose**: Allow constant function calls without consuming energy, improving query performance for read-only operations.

## Dynamic Configuration
```
  # Dynamic loading configuration function, disabled by default
  dynamicConfig = {
    enable = true
    # Configuration file change check interval, default is 600 seconds
    checkInterval = 600
  }
```
**Purpose**: Enable hot configuration updates without node restart, reducing maintenance downtime.

## Internal Transaction Recording
To save more internal transactions:
```
saveInternalTx = true
saveFeaturedInternalTx = true
saveCancelAllUnfreezeV2Details = true
```
**Purpose**: Record complete transaction traces including internal calls, freeze/vote operations, and resource cancellation details for comprehensive blockchain analysis.

## JSON-RPC Ethereum Compatibility
```
    httpFullNodeEnable = true
    httpFullNodePort = 8545
    httpSolidityEnable = true
    httpSolidityPort = 8555
    httpPBFTEnable = true
    httpPBFTPort = 8565
```
**Purpose**: Provide Ethereum-compatible JSON-RPC interface on standard port 8545, enabling integration with existing Ethereum tooling (MetaMask, Web3.js, etc.).

## Block Event Streaming
```
  topics = [
    {
      triggerName = "block" // block trigger, the value can't be modified
      enable = true
      topic = "block" // plugin topic, the value could be modified
      solidified = false // if set true, just need solidified block, default is false
    },
```
**Purpose**: Enable real-time block notifications via ZeroMQ for external monitoring and indexing services.
