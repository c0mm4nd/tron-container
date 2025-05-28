sh downloader.sh

JVM_OPT="-Xmx$HEAP_SIZE -XX:+HeapDumpOnOutOfMemoryError"
echo "JVM_OPT: $JVM_OPT"
java $JVM_OPT -jar FullNode.jar -c main_net_config.conf
echo "FullNode exited"

