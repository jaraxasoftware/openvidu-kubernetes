# openvidu-kubernetes

![Version: 2.27.0](https://img.shields.io/badge/Version-2.27.0-informational?style=flat-square) ![AppVersion: 2.27.0](https://img.shields.io/badge/AppVersion-2.27.0-informational?style=flat-square)

Jaraxa implementation of openvidu on Kubernetes

**Homepage:** <https://github.com/jaraxasoftware/openvidu-kubernetes/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Sergio Jurado | sergio.jurado@jaraxa.com |  |

## Source Code

* <https://github.com/openvidu/openvidu/>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"openvidu.localhost"` |  |
| ingress.paths[0] | string | `"/(.*)"` |  |
| ingress.tls[0].hosts[0] | string | `"openvidu.localhost"` |  |
| ingress.tls[0].secretName | string | `"openvidu-secret"` |  |
| jx.imagePullSecrets | list | `[]` |  |
| jx.releaseCRD | bool | `true` |  |
| keda.annotations | object | `{}` |  |
| keda.coolDown | int | `30` |  |
| keda.cron.end | string | `"15 15 * * *"` |  |
| keda.cron.start | string | `"00 15 * * *"` |  |
| keda.cron.timeZone | string | `"Europe/Madrid"` |  |
| keda.enabled | bool | `false` |  |
| keda.extraTriggers | object | `{}` |  |
| keda.interval | int | `30` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `1` |  |
| mode | string | `"deployment"` |  |
| nodeSelector | object | `{}` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.initialDelaySeconds | int | `60` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `1` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| resourcesPro.master | object | `{}` |  |
| resourcesPro.media | object | `{}` |  |
| resourcesPro.monitoring | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.externalPort | int | `5443` |  |
| service.name | string | `"openvidu"` |  |
| serviceAccount.create | bool | `false` |  |
| services.kms.enabled | bool | `true` |  |
| services.kms.env.KMS_MAX_PORT | string | `"45000"` |  |
| services.kms.env.KMS_MIN_PORT | string | `"40000"` |  |
| services.kms.env.KURENTO_LOGS_PATH | string | `"/var/log/kurento-media-server/"` |  |
| services.kms.image.pullPolicy | string | `"IfNotPresent"` |  |
| services.kms.image.repository | string | `"kurento/kurento-media-server"` |  |
| services.kms.image.tag | string | `"7.0.1"` |  |
| services.kms.port | int | `8888` |  |
| services.kms.protocols[0] | string | `"TCP"` |  |
| services.kms.type | string | `"media"` |  |
| services.logging.enabled | bool | `false` |  |
| services.logging.image.pullPolicy | string | `"IfNotPresent"` |  |
| services.logging.image.repository | string | `"docker.elastic.co/beats/filebeat-oss"` |  |
| services.logging.image.tag | string | `"7.17.9"` |  |
| services.logging.type | string | `"monitoring"` |  |
| services.media-node-controller.enabled | bool | `false` |  |
| services.media-node-controller.env | object | `{}` |  |
| services.media-node-controller.image.pullPolicy | string | `"IfNotPresent"` |  |
| services.media-node-controller.image.repository | string | `"openvidu/media-node-controller"` |  |
| services.media-node-controller.image.tag | string | `"2.27.0"` |  |
| services.media-node-controller.port | int | `3000` |  |
| services.media-node-controller.protocols[0] | string | `"TCP"` |  |
| services.media-node-controller.type | string | `"media"` |  |
| services.metricbeat.enabled | bool | `false` |  |
| services.metricbeat.image.pullPolicy | string | `"IfNotPresent"` |  |
| services.metricbeat.image.repository | string | `"docker.elastic.co/beats/metricbeat-oss"` |  |
| services.metricbeat.image.tag | string | `"7.17.9"` |  |
| services.metricbeat.type | string | `"monitoring"` |  |
| services.openvidu-call.enabled | bool | `false` |  |
| services.openvidu-call.env | object | `{}` |  |
| services.openvidu-call.image.pullPolicy | string | `"IfNotPresent"` |  |
| services.openvidu-call.image.repository | string | `"openvidu/openvidu-call"` |  |
| services.openvidu-call.image.tag | string | `"2.27.0"` |  |
| services.openvidu-call.port | int | `5442` |  |
| services.openvidu-call.protocols[0] | string | `"TCP"` |  |
| services.openvidu-call.type | string | `"test"` |  |
| services.openvidu.bandwidth.received.max | int | `1000` |  |
| services.openvidu.bandwidth.received.min | int | `300` |  |
| services.openvidu.bandwidth.send.max | int | `1000` |  |
| services.openvidu.bandwidth.send.min | int | `300` |  |
| services.openvidu.cdr.enabled | bool | `false` |  |
| services.openvidu.cdr.path | string | `"/opt/openvidu/cdr"` |  |
| services.openvidu.configDir | string | `"/opt/openvidu/"` |  |
| services.openvidu.coturn.iceServers | string | `"[\"url=turn:localhost:3478,username=turn,credential=nknk\"]"` |  |
| services.openvidu.coturn.ip | string | `"localhost.openvidu"` |  |
| services.openvidu.coturn.port | int | `3478` |  |
| services.openvidu.coturn.redis.db | int | `1` |  |
| services.openvidu.coturn.redis.ip | string | `"localhost-redis-master"` |  |
| services.openvidu.coturn.redis.password | string | `"changeit"` |  |
| services.openvidu.coturn.uris | string | `"turn:localhost:3478?transport=tcp"` |  |
| services.openvidu.enabled | bool | `true` |  |
| services.openvidu.env | object | `{}` |  |
| services.openvidu.gc.interval | int | `900` |  |
| services.openvidu.gc.threshold | int | `3600` |  |
| services.openvidu.image.pullPolicy | string | `"IfNotPresent"` |  |
| services.openvidu.image.repository | string | `"openvidu/openvidu-server"` |  |
| services.openvidu.image.tag | string | `"2.27.0"` |  |
| services.openvidu.kms.uris[0] | string | `"ws://localhost:8888/kurento"` |  |
| services.openvidu.port | int | `443` |  |
| services.openvidu.pro.autoscaling | bool | `false` |  |
| services.openvidu.pro.browserLogs | string | `"disabled"` |  |
| services.openvidu.pro.cluster | bool | `true` |  |
| services.openvidu.pro.elasticsearch.daysRetention | int | `7` |  |
| services.openvidu.pro.elasticsearch.enabled | bool | `true` |  |
| services.openvidu.pro.elasticsearch.kibanaIngress.annotations | object | `{}` |  |
| services.openvidu.pro.elasticsearch.kibanaIngress.enabled | bool | `false` |  |
| services.openvidu.pro.elasticsearch.kibanaIngress.hosts[0] | string | `"openvidu.localhost"` |  |
| services.openvidu.pro.elasticsearch.kibanaIngress.paths[0] | string | `"/kibana/"` |  |
| services.openvidu.pro.elasticsearch.kibanaIngress.tls[0].hosts[0] | string | `"openvidu.localhost"` |  |
| services.openvidu.pro.elasticsearch.kibanaIngress.tls[0].secretName | string | `"openvidu-secret"` |  |
| services.openvidu.pro.elasticsearch.nodeCount | int | `1` |  |
| services.openvidu.pro.elasticsearch.password | string | `"changeme"` |  |
| services.openvidu.pro.elasticsearch.resources | object | `{}` |  |
| services.openvidu.pro.elasticsearch.serviceType | string | `"ClusterIP"` |  |
| services.openvidu.pro.elasticsearch.storageClassName | string | `"do-block-storage"` |  |
| services.openvidu.pro.elasticsearch.user | string | `"elastic"` |  |
| services.openvidu.pro.elasticsearch.version | string | `"7.17.9"` |  |
| services.openvidu.pro.elasticsearch.volumeSize | string | `"10Gi"` |  |
| services.openvidu.pro.enabled | bool | `true` |  |
| services.openvidu.pro.environment | string | `"on_premise"` |  |
| services.openvidu.pro.license | string | `"xxxxxx-yyyyyy-zzzzzz-aaaaaa-bbbb"` |  |
| services.openvidu.pro.loadStrategy | string | `"streams"` |  |
| services.openvidu.pro.masterReplicas | int | `1` |  |
| services.openvidu.pro.mediaNodeReplicas | int | `1` |  |
| services.openvidu.pro.mediaReconnTimeout | int | `5` |  |
| services.openvidu.pro.mode | string | `"manual"` |  |
| services.openvidu.pro.monitoringInterval | int | `30` |  |
| services.openvidu.pro.networkQoS | bool | `false` |  |
| services.openvidu.protocols[0] | string | `"TCP"` |  |
| services.openvidu.recording.autostop | int | `120` |  |
| services.openvidu.recording.debug | bool | `false` |  |
| services.openvidu.recording.enabled | bool | `false` |  |
| services.openvidu.recording.layout | string | `"/opt/openvidu/custom-layout"` |  |
| services.openvidu.recording.notification | string | `"publisher_moderator"` |  |
| services.openvidu.recording.path | string | `"/opt/openvidu/recordings"` |  |
| services.openvidu.recording.public | bool | `false` |  |
| services.openvidu.secret | string | `"openvidu"` |  |
| services.openvidu.ssl.certType | string | `"owncert"` |  |
| services.openvidu.ssl.enabled | bool | `false` |  |
| services.openvidu.transcoding.enabled | bool | `false` |  |
| services.openvidu.type | string | `"master"` |  |
| services.openvidu.webhook.enabled | bool | `true` |  |
| services.openvidu.webhook.endpoint | string | `"http://localhost/api/v1/your_webhook/openvidu"` |  |
| services.openvidu.webhook.events | string | `"[\"sessionCreated\", \"sessionDestroyed\", \"participantJoined\", \"participantLeft\", \"webrtcConnectionCreated\", \"webrtcConnectionDestroyed\", \"recordingStatusChanged\", \"filterEventDispatched\"]"` |  |
| services.openvidu.webhook.headers | string | `""` |  |
| test.enabled | bool | `false` |  |
| tolerations | list | `[]` |  |
| updateStrategy | string | `"OnDelete"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.4.0](https://github.com/norwoodj/helm-docs/releases/v1.4.0)
