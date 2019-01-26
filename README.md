# nvidia_smi_exporter

nvidia-smi metrics exporter for Prometheus (Modified Fork Version)

Note that this fork version **removes the support** for utilization functionalities, which the older generation NVIDIA cards doesn't have.

Binary program and MAKEFILE are provided for fast deployment.

## Install the exporter to system
```
# make install
```

## Build
```
> go build -v nvidia_smi_exporter
```

## Run
```
> ./nvidia_smi_exporter [<port>]
```
Default port is 9101


### localhost:9101/metrics
```
temperature_gpu{gpu="TITAN X (Pascal)[0]"} 41
memory_total{gpu="TITAN X (Pascal)[0]"} 12189
memory_free{gpu="TITAN X (Pascal)[0]"} 12189
memory_used{gpu="TITAN X (Pascal)[0]"} 0
temperature_gpu{gpu="TITAN X (Pascal)[1]"} 78
memory_total{gpu="TITAN X (Pascal)[1]"} 12189
memory_free{gpu="TITAN X (Pascal)[1]"} 1738
memory_used{gpu="TITAN X (Pascal)[1]"} 10451
temperature_gpu{gpu="TITAN X (Pascal)[2]"} 83
memory_total{gpu="TITAN X (Pascal)[2]"} 12189
memory_free{gpu="TITAN X (Pascal)[2]"} 190
memory_used{gpu="TITAN X (Pascal)[2]"} 11999
temperature_gpu{gpu="TITAN X (Pascal)[3]"} 84
memory_total{gpu="TITAN X (Pascal)[3]"} 12189
memory_free{gpu="TITAN X (Pascal)[3]"} 536
memory_used{gpu="TITAN X (Pascal)[3]"} 11653
```

### Exact command
```
nvidia-smi --query-gpu=name,index,temperature.gpu,memory.total,memory.free,memory.used --format=csv,noheader,nounits
```

### Prometheus example config

```
- job_name: "gpu_exporter"
  static_configs:
  - targets: ['localhost:9101']
```

## Remove the utility
```
# make uninstall
```
