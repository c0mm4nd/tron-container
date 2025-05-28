# Configuration File Updates

Some changes to the configuration file:

```
balance.history.lookup = true
```

```
supportConstant = true
```

```
  # Dynamic loading configuration function, disabled by default
  dynamicConfig = {
    enable = true
    # Configuration file change check interval, default is 600 seconds
    checkInterval = 600
  }
```

To save more internal transactions:
```
saveInternalTx = true
saveFeaturedInternalTx = true
saveCancelAllUnfreezeV2Details = true
```

```
    httpFullNodeEnable = true
    httpFullNodePort = 8545
    httpSolidityEnable = true
    httpSolidityPort = 8555
    httpPBFTEnable = true
    httpPBFTPort = 8565
```

```
  topics = [
    {
      triggerName = "block" // block trigger, the value can't be modified
      enable = true
      topic = "block" // plugin topic, the value could be modified
      solidified = false // if set true, just need solidified block, default is false
    },
```
