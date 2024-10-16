{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "openvidu.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openvidu.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "openvidu.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "openvidu.labels" -}}
app.kubernetes.io/name: {{ include "openvidu.name" . }}
helm.sh/chart: {{ include "openvidu.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "openvidu.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "openvidu.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for ingress.
*/}}
{{- define "openvidu.ingress.apiVersion" -}}
{{- if semverCompare "<1.14-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "extensions/v1beta1" -}}
{{- else if semverCompare "<1.19-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "networking.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "networking.k8s.io/v1" -}}
{{- end -}}
{{- end -}}

{{/*
Generate the proper args for stunnerd
*/}}
{{- define "openvidu.stunnerGatewayOperator.args" -}}
{{- if not .Values.stunner.standalone.enabled }}
command: ["stunnerd"]
{{- with .Values.stunner.deployment.container.stunnerd.udpMultithreading}}
{{- if .enabled }}
args: ["-w", "-c", "file://etc/stunnerd/stunnerd.conf", "--udp-thread-num={{ .readLoopsPerUDPListener}}"]
{{- else }}
args: ["-w", "-c", "file://etc/stunnerd/stunnerd.conf"]
{{- end }}
env:
  - name: STUNNER_ADDR
    valueFrom:
      fieldRef:
        apiVersion: v1
        fieldPath: status.podIP
volumeMounts:
  - name: stunnerd-config-volume
    mountPath: /etc/stunnerd
    readOnly: true
{{- end }}
{{- else }}
{{- with .Values.stunner.deployment.container.stunnerd.udpMultithreading}}
command: ["stunnerd"]
{{- if .enabled }}
args: ["-c", "file://stunnerd.conf", "--udp-thread-num={{ .readLoopsPerUDPListener}}"]
{{- else }}
args: ["-c", "file://stunnerd.conf",]
{{- end }}
envFrom:
  - configMapRef:
      name: stunnerd-config
env:
- name: STUNNER_ADDR  # we use the POD IP
  valueFrom:
    fieldRef:
      fieldPath: status.podIP
{{- end }}      
{{- end }}
{{- end }}

{{/*
Generate the proper args for stunnerd
*/}}
{{- define "openvidu.stunnerGatewayOperator.volume" -}}
{{- if eq .Values.stunner.standalone.enabled false }}
volumes:
  - name: stunnerd-config-volume
{{- if eq .Values.stunner.deployment.container.configWatcher.enabled false}}
    configMap:
      name: stunnerd-config
      optional: true
{{- end }}     
{{- end }}
{{- end }}