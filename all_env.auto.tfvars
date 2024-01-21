
env = "all-env"


dd_properties = [
  
{
  name = "[kubernetes] Monitor Kubernetes Service Endpoint"
  alert_type = "metric alert"
  alert_message = "Monitor Kubernetes Service Endpoint @pagerduty-Kubernetes"
  alert_query = "max(last_5m):sum:kubernetes_state.endpoint.address_available{kube_namespace:apps} by {kube_endpoint,kube_namespace,kube_cluster_name} < 1"
  alert_critical = 1 
  timeout_h = 1
  new_group_delay = 60
},
{
  name = "[kubernetes] K8s Pod restarted more than once in 10 min"
  alert_type = "metric alert"
  alert_message = "[kubernetes] {{ pod_name.name }} {{ kube_cluster_name.name }} {{ env.name }}K8s pod restarted @pagerduty-Kubernetes"
  alert_query = "change(min(last_10m),last_1h):avg:kubernetes.containers.restarts{*} by {env,kube_cluster_name,kube_deployment,pod_name} > 1"
  alert_critical = 1
  timeout_h = 1
  new_group_delay = 60
},
{
 name = "[kubernetes] K8s Pods are in containercreating state for more than 30 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes] {{ kube_cluster_name.name }} {{ kube_namespace.name }} {{ kube_deployment.name }} K8s pod are in containercreating state for more than 10 minutes @pagerduty-Kubernetes"
 alert_query = "max(last_30m):max:kubernetes_state.container.status_report.count.waiting{reason:containercreating} by {kube_cluster_name,kube_namespace,kube_deployment} >= 1"
 alert_critical = 1
 alert_critical_recovery = 0
 timeout_h = 1
 new_group_delay = 60
},
{
 name = "[kubernetes] K8s Pods are in Pending state for more than 30 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes] {{ kube_cluster_name.name }} {{ kube_namespace.name }} {{ env.name }} {{ kube_deployment.name }} K8s pod are in Pending state for more than 10 minutes @pagerduty-Kubernetes"
 alert_query = "max(last_30m):max:kubernetes_state.pod.status_phase{pod_phase:pending} by {kube_cluster_name,kube_namespace,env,kube_deployment} >= 1"
 alert_critical = 1
 alert_critical_recovery = 0
 timeout_h = 1
 new_group_delay = 60
},
{
 name = "[kubernetes] K8s Pods are not in Running state for more than 10 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes] {{ kube_cluster_name.name }} {{ kube_namespace.name }} {{ kube_deployment.name }} {{ env.name }} K8s pod is not in Running state for more than 10 minutes @pagerduty-Kubernetes"
 alert_query = "max(last_10m):max:kubernetes_state.pod.status_phase{!pod_phase:running,!pod_phase:pending} by {kube_cluster_name,kube_namespace,kube_deployment,env} >= 1"
 alert_critical = 1
 timeout_h = 1
 new_group_delay = 60

},
{
 name = "[kubernetes] K8s Pods are in unknown state for more than 10 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes] {{ kube_cluster_name.name }} {{ kube_namespace.name }} {{ kube_deployment.name }} K8s pod are in unknown state for more than 10 minutes @pagerduty-Kubernetes"
 alert_query = "max(last_10m):max:kubernetes_state.container.status_report.count.waiting{!reason:containercreating,!reason:crashloopbackoff,!reason:imagepullbackoff} by {kube_cluster_name,kube_namespace,kube_deployment} >= 1"
 alert_critical = 1
 timeout_h = 1
 new_group_delay = 60
},
{
 name = "[kubernetes] K8s Pods are in crashloopbackoff state for continuously more than 10 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes] {{ kube_cluster_name.name }} {{ kube_namespace.name }} {{ kube_deployment.name }} K8s pod are in crashloopbackoff state for continuously more than 10 minutes @pagerduty-Kubernetes"
 alert_query = "sum(last_10m):sum:kubernetes_state.container.status_report.count.waiting{reason:crashloopbackoff} by {kube_cluster_name, kube_namespace, kube_deployment} >= 1"
 alert_critical = 1
 timeout_h = 1
 new_group_delay = 60
},
{
 name = "[kubernetes] K8s Pods are in imagepullbackoff state for more than 30 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes] {{kube_cluster_name.name}} {{ kube_namespace.name }} {{kube_deployment.name}} K8s pod are in imagepullbackoff state for more than 30 minutes @pagerduty-Kubernetes"
 alert_query = "max(last_30m):max:kubernetes_state.container.status_report.count.waiting{reason:imagepullbackoff} by {kube_cluster_name,kube_namespace,kube_deployment} >= 1"
 alert_critical = 1
 timeout_h = 1
 new_group_delay = 60
},
{
  name = "[kubernetes] Monitor Kubernetes HPA Utlisation"
  alert_type = "metric alert"
  alert_message = "[kubernetes] {{horizontalpodautoscaler.name}} of {{ cluster-name.name }} K8s HPA Usage @pagerduty-Kubernetes"
  alert_query = "avg(last_10m):avg:kubernetes_state.hpa.spec_target_metric{*} by {horizontalpodautoscaler,metric_name,metric_target_type,kube_namespace,kube_cluster_name} > 85"
  alert_warning = 80
  alert_critical = 85
  timeout_h = 1
  new_group_delay= 60
},
{
  name = "[kubernetes-ss] K8s Pod restarted more than once in 10 min"
  alert_type = "metric alert"
  alert_message = "[kubernetes-ss] {{ pod_name.name }} {{ kube_cluster_name.name }} {{ env.name }}K8s pod restarted @pagerduty-Kubernetes"
  alert_query = "change(min(last_10m),last_1h):avg:kubernetes.containers.restarts{*} by {env,kube_cluster_name,kube_stateful_set,pod_name} > 1"
  alert_critical = 1
  timeout_h = 1
  new_group_delay = 60
},
{
 name = "[kubernetes-ss] K8s Pods are in containercreating state for more than 30 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes-ss] {{ kube_clster_name.name }} {{ kube_namespace.name }} {{ kube_stateful_set.name }} K8s pod are in containercreating state for more than 30 minutes @pagerduty-Kubernetes"
 alert_query = "max(last_30m):max:kubernetes_state.container.status_report.count.waiting{reason:containercreating} by {kube_cluster_name,kube_namespace,kube_stateful_set} >= 1"
 alert_critical = 1
 timeout_h = 1
 new_group_delay = 60
},
{
 name = "[kubernetes-ss] K8s Pods are in Pending state for more than 30 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes-ss] {{ kube_cluster_name.name }} {{ kube_namespace.name }} {{ env.name }} {{ kube_stateful_set.name }} K8s pod are in Pending state for more than 30 minutes @pagerduty-Kubernetes"
 alert_query = "max(last_30m):max:kubernetes_state.pod.status_phase{pod_phase:pending} by {kube_cluster_name,kube_namespace,env,kube_stateful_set} >= 1"
 alert_critical = 1
 timeout_h = 1
 new_group_delay = 60
},
{
 name = "[kubernetes-ss] K8s Pods are not in Running state for more than 10 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes-ss] {{ kube_cluster_name.name }} {{ kube_namespace.name }} {{ kube_stateful_set.name }} {{ env.name }} K8s pod is not in Running state for more than 10 minutes @pagerduty-Kubernetes"
 alert_query = "max(last_10m):max:kubernetes_state.pod.status_phase{!pod_phase:running,!pod_phase:pending} by {kube_cluster_name,kube_namespace,kube_stateful_set,env} >= 1"
 alert_critical = 1
 timeout_h = 1
 new_group_delay = 60

},
{
 name = "[kubernetes-ss] K8s Pods are in unknown state for more than 10 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes-ss] {{ kube_cluster_name.name }} {{ kube_namespace.name }} {{ kube_stateful_set.name }} K8s pod are in unknown state for more than 10 minutes @pagerduty-Kubernetes"
 alert_query = "max(last_10m):max:kubernetes_state.container.status_report.count.waiting{!reason:containercreating,!reason:crashloopbackoff,!reason:imagepullbackoff} by {kube_cluster_name,kube_namespace,kube_stateful_set} >= 1"
 alert_critical = 1
 timeout_h = 1
 new_group_delay = 60
},
{
 name = "[kubernetes-ss] K8s Pods are in crashloopbackoff state for more than 10 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes-ss] {{ kube_cluster_name.name }} {{ kube_namespace.name }} {{ kube_stateful_set.name }} K8s pod are in crashloopbackoff state for more than 10 minutes @pagerduty-Kubernetes"
 alert_query = "max(last_10m):max:kubernetes_state.container.status_report.count.waiting{reason:crashloopbackoff} by {kube_cluster_name,kube_namespace,kube_stateful_set} >= 1"
 alert_critical = 1
 timeout_h = 1
 new_group_delay = 60
},
{
 name = "[kubernetes-ss] K8s Pods are in imagepullbackoff state for more than 10 minutes"
 alert_type = "metric alert"
 alert_message = "[kubernetes-ss] {{kube_cluster_name.name}} {{ kube_namespace.name }} {{kube_stateful_set.name}} K8s pod are in imagepullbackoff state for more than 10 minutes @pagerduty-Kubernetes"
 alert_query = "max(last_10m):max:kubernetes_state.container.status_report.count.waiting{reason:imagepullbackoff} by {kube_cluster_name,kube_namespace,kube_stateful_set} >= 1"
 alert_critical = 1
 timeout_h = 1
 new_group_delay = 60
},

{
  name = "[host] Monitor Disk space usage"
  alert_type = "metric alert"
  alert_message = "[host] Disk space usage {{host.name}} {{device.name}} {{env.name}} @pagerduty-Servers"
  alert_query = "avg(last_15m):avg:system.disk.in_use{*} by {host,name,device,env} > 0.8"
  alert_warning = 0.75
  alert_critical = 0.8
  new_group_delay= 300
  ddpriority = 4
},

{ 
  name = "[host] Monitor CPU Utilisation"
  alert_type = "metric alert"
  alert_message = "[host] CPU Utilisation {{host.name}} {{device.name}} {{env.name}} @pagerduty-Elasticache"
  alert_query = "min(last_10m):(avg:aws.elasticache.engine_cpuutilization{*} by {region,cacheclusterid,cachenodeid,env}) > 85"
  alert_warning = 80
  alert_critical = 85
  new_group_delay= 60
  ddpriority = 4
},

{ 
  name = "[host] Monitor Memory Usage"
  alert_type = "metric alert"
  alert_message = "[host] Memory Usage {{host.name}} {{device.name}} {{env.name}} @pagerduty-Elasticache"
  alert_query = "pct_change(avg(last_5m),last_10m):avg:aws.elasticache.freeable_memory{*} by {region,cacheclusterid,cachenodeid,env} < -80"
  alert_warning = -75
  alert_critical = -80
  new_group_delay= 60
  ddpriority = 4
},

{
  name = "[host] Monitor Network Bandwidth IN Exceed"
  alert_type = "metric alert"
  alert_message = "[host] Memory Usage {{host.name}} {{device.name}} {{env.name}} @pagerduty-Elasticache"
  alert_query = "max(last_5m):(avg:aws.elasticache.network_allowance_exceeded.in{*} by {region,cacheclusterid,cachenodeid,env}) >= 1"
  alert_warning = 0.9
  alert_critical = 1
  new_group_delay= 60
  ddpriority = 4
},

{
  name = "[host] Monitor Network Bandwidth OUT Exceed"
  alert_type = "metric alert"
  alert_message = "[host] Network Allowance OUT Exceeded {{host.name}} {{device.name}} {{env.name}} @pagerduty-Elasticache"
  alert_query = "max(last_5m):(avg:aws.elasticache.network_allowance_exceeded.out{*} by {region,cacheclusterid,cachenodeid,env}) >= 1"
  alert_warning = 0.9
  alert_critical = 1
  new_group_delay= 60
  ddpriority = 4
},

{
  name = "[Lambda] Monitor Lambda Percentage of errors"
  alert_type = "metric alert"
  alert_message = "[Lambda] Monitor Lambda Percentage of errors {{ function.name }} of {{ aws_account.name }} {{ env.name }} @pagerduty-Lambda"
  alert_query = "sum(last_1h):100 * sum:aws.lambda.errors{env:*} by {functionname,env,aws_account}.as_count() / sum:aws.lambda.invocations{env:*} by {functionname,env,aws_account}.as_count() > 45"
  alert_critical = 45
  timeout_h = 1
  ddpriority = 4

},

{
  name = "[Lambda] Monitor Lambda Iteration Age"
  alert_type = "metric alert"
  alert_message = "[Lambda] Monitor Lambda Iteration Age {{ function.name }} of {{ aws_account.name }} {{ env.name }} @pagerduty-Lambda"
  alert_query = "avg(last_10m):avg:aws.lambda.iterator_age{*} by {env,name,functionname,aws_account} > 7200000"
  alert_critical = 7200000
  timeout_h = 1
  ddpriority = 4
},

{
  name = "RDS instance CPU utilization is above 80%"
  alert_type = "metric alert"
  alert_message = "{{ dbinstanceidentifier.name }} of {{ env.name }} cpu  utilisation is above 80% @pagerduty-Database"
  alert_query = "avg(last_1h):avg:aws.rds.cpuutilization{*,*,*} by {dbinstanceidentifier,env} > 80"
  alert_critical = 80
},


{
  name = "Increase in {{ env.name }} Apigateway 5XX error"
  alert_type = "metric alert"
  alert_message = "Increase in {{ apiname.name }} Apigateway 5XX error in {{ aws_account.name }} {{ env.name }} @pagerduty-APIGW "
  alert_query = "change(sum(last_1h),last_5m):sum:aws.apigateway.5xxerror{*} by {env,aws_account,apiname}.as_count() > 100"
  alert_warning = 80
  alert_critical = 100
  ddpriority = 4
},

{
  name = "Increase in {{ env.name }} Apigateway 4XX error"
  alert_type = "query alert"
  alert_message = "Increase in {{ apiname.name }} Apigateway 4XX error in {{ aws_account.name }} {{ env.name }} @pagerduty-APIGW "
  alert_query = "avg(last_1d):anomalies(sum:aws.apigateway.4xxerror{*} by {env,aws_account,apiname}.as_count(), 'agile', 2, direction='both', interval=300, alert_window='last_1h', count_default_zero='true', seasonality='daily') >= 1"
  alert_critical = 1
  ddpriority = 4
},

{
  name = "Increase in {{ env.name }} Apigateway Latency"
  alert_type = "metric alert"
  alert_message = "Increase in {{ apiname.name }} Apigateway latency for {{ resource.name }} in {{ aws_account.name }} {{ env_type.name }} @pagerduty-APIGW "
  alert_query = "avg(last_10m):avg:aws.apigateway.latency{*} by {env,aws_account,apiname,resource} > 20000"
  alert_warning = 15000
  alert_critical = 20000
  ddpriority = 4
},
{
  name = "{{ env.name }} Server Disk Usage is above 80%"
  alert_type = "metric alert"
  alert_message = "Server Disk Usage is above 80% {{ env.name }} {{ host.name }} {{ aws_account.name }} @pagerduty-Servers"
  alert_query = "avg(last_5m):100 * avg:system.disk.used{*} by {env,host,aws_account} / avg:system.disk.total{*} by {env,host,aws_account} > 80"
  alert_warning = 75
  alert_critical = 80
  ddpriority = 4
},
{
  name = "[IOT] AWS IOT Message Publish In Rate Decrease"
  alert_type = "query alert"
  alert_message = "[IOT] AWS IOT Message Publish In Rate Decrease"
  alert_query = "sum(last_2d):anomalies(sum:aws.iot.publish_in_success{*} by {env}.as_count(), 'agile', 2, direction='below', interval=600, alert_window='last_4h', count_default_zero='true', seasonality='daily') < 1"
  alert_critical = 1
  ddpriority = 4

},

{
  name = "[DD] Custom metrics usage cost"
  alert_type = "query alert"
  alert_message = "[DD] Custom metrics usage cost"
  alert_query = "avg(last_2w):anomalies(avg:datadog.estimated_usage.metrics.custom.by_metric{*} by {metric_name}, 'basic', 2, direction='both', interval=7200, alert_window='last_2d', count_default_zero='true') >= 1"
  alert_critical = 1
  ddpriority = 4

},
{
  name = "GCP Dataflow Job failed"
  alert_type = "metric alert"
  alert_message = "GCP Dataflow job {{ job_name.name }} failed in {{ project_id.name }} @pagerduty-Servers"
  alert_query = "avg(last_1h):avg:gcp.dataflow.job.is_failed{*} by {project_id,job_name} >= 1"
  alert_critical = 1
  ddpriority = 4
},

{
  name = "[Google Cloud Dataflow] backlog seconds is high on {{job_name.name}}"
  alert_type = "metric alert"
  alert_message = "Backlog seconds is high on {{ job_name.name }} of {{ project_id.name }} env in {{ stage.name }} stage . @pagerduty-Servers"
  alert_query = "avg(last_1h):avg:gcp.dataflow.job.estimated_backlog_processing_time{*} by {job_name,stage,project_id} > 3"
  alert_critical = 3
  ddpriority = 4
},

{
  name = "IOT Core errored out while pushing message to Kafka in {{ env.name }}"
  alert_type = "metric alert"
  alert_message = "IOT Core errored out while pushing message to Kafka in {{ env.name }} {{ aws_account.name }} for {{ rulename.name }} @pagerduty-Servers"
  alert_query = "sum(last_1h):sum:aws.iot.failure{actiontype:kafka} by {env,aws_account,rulename}.as_count() >= 1"
  alert_critical = 1
  ddpriority = 4
},

{
  name = "Confluent Kafka topic are not consumed"
  alert_type = "metric alert"
  alert_message = "Confluent Kafka topic are not consumed for {{ topic.name }} in {{ kafka_cluster.name }} {{ resource_id.name }}@pagerduty-Servers"
  alert_query = "avg(last_1h):avg:confluent_cloud.kafka.consumer_lag_offsets{*} by {topic,kafka_cluster,resource_id} > 6000000000"
  alert_critical = 6000000000
  alert_warning  = 5000000000
  ddpriority = 4
},

{
  name = "High unacked message age in {{ project_id.name }}"
  alert_type = "metric alert"
  alert_message = "High unacked message age for {{ subscription_id.name }} in {{ project_id.name }} @pagerduty-Servers"
  alert_query = "avg(last_1h):avg:gcp.pubsub.subscription.oldest_unacked_message_age{*} by {project_id,subscription_id} > 7200"
  alert_critical = 7200
  alert_warning  = 5400
  ddpriority = 4
},

{
  name = "GCP Cloud SQL Disk Utilisation"
  alert_type = "metric alert"
  alert_message = "GCP Cloud SQL Disk Utilisation {{project_id.name}} {{database_id.name}} @pagerduty-Database"
  alert_query = "avg(last_1h):avg:gcp.cloudsql.database.disk.utilization{*} by {database_id,project_id} > 0.8"
  alert_critical = 0.8
  ddpriority = 4 
},

{
  name = "GCP CloudSql CPU Utilisation"
  alert_type = "metric alert"
  alert_message = "GCP CloudSql CPU Utilisation {{project_id.name}} {{database_id.name}} @pagerduty-Database"
  alert_query = "avg(last_1h):avg:gcp.cloudsql.database.cpu.utilization{*} by {database_id,project_id} > 0.8"
  alert_critical = 0.8
  ddpriority = 4
},

{
  name = "GCP Redis CPU Utilisation"
  alert_type = "metric alert"
  alert_message = "GCP Redis CPU Utilisation {{instance_id.name}} {{project_id.name}} @pagerduty-Redis"
  alert_query = "avg(last_1h):avg:gcp.redis.stats.cpu_utilization{*} by {project_id,instance_id} > 0.1"
  alert_critical = 0.1
  ddpriority = 4
},

{
  name = "GCP CloudRun High Error Rates"
  alert_type = "metric alert"
  alert_message = "CloudRun High Error Rates {{project_id.name}} {{service_name.name}} @pagerduty-Serverless"
  alert_query = "sum(last_1h):sum:gcp.run.request_count{(response_code_class:4xx OR response_code_class:5xx)} by {project_id,service_name}.as_count().fill(null) * 100 / sum:gcp.run.request_count{*} by {project_id,service_name}.as_count().fill(null) > 80"
  alert_critical = 80
  ddpriority = 4
},

{
  name = "GCP CloudRun High Iterator Age"
  alert_type = "metric alert"
  alert_message = "CloudRun High Iterator Age {{project_id.name}} {{service_name.name}} @pagerduty-Serverless"
  alert_query = "avg(last_15m):avg:gcp.run.request_latencies{*} by {project_id,service_name} > 900"
  alert_critical = 900
  ddpriority = 4
},

{
  name = "GCP CloudFunction High Iterator Age"
  alert_type = "metric alert"
  alert_message = "CloudFunction High Iterator Age {{project_id.name}} {{function_name.name}} @pagerduty-Serverless"
  alert_query = "avg(last_15m):avg:gcp.cloudfunctions.function.execution_times{*} by {project_id,function_name} > 900"
  alert_critical = 900
  ddpriority = 4
},

## PUBSUB ##

{
  name = "GCP PubSub Subscription Unacked Exceeding Limit - export-logs-to-datadog"
  alert_type = "metric alert"
  alert_message = "PubSub Subscription exceeding unacked limit of 1 Day {{project_id.name}} {{subscription_id.name}} @pagerduty-Serverless"
  alert_query = "max(last_1d):max:gcp.pubsub.subscription.oldest_unacked_message_age{export-logs-to-datadog} by {project_id} > 86400"
  alert_critical = 86400
  ddpriority = 4
},
# PUBSUB END #

{
  name = "HTTP 429 Too Many Requests error for {{[@http.route].name}} API of {{ service.name }} in {{ env.name }}"
  alert_type = "trace-analytics alert"
  alert_message = "HTTP 429 Too Many Requests error for {{[@http.route].name}} API of {{ service.name }} in {{ env.name }} @pagerduty-Kubernetes"
  alert_query = "trace-analytics(\"@http.status_code:429\").rollup(\"count\").by(\"env,service,@http.route\").last(\"5m\") > 100"
  alert_critical = 100
  alert_warning = 85
},

]


dd_tags = [
{
 metric_name  = "http.server.duration"
 metric_type  = "distribution"
 metric_tags         = ["env", "service", "version", "deployment.environment", "service.name", "service.version", "http.method", "http.status_code", "http.route"] 
 include_percentiles = "true"
},
{
 metric_name  = "http.server.request_content_length"
 metric_type  = "count"
 metric_tags         = ["env", "service", "version", "deployment.environment", "service.name", "service.version", "http.method", "http.status_code", "http.route"] 
},

{
 metric_name  = "http.server.response_content_length"
 metric_type  = "count"
 metric_tags         = ["env", "service", "version", "deployment.environment", "service.name", "service.version", "http.method", "http.status_code", "http.route"] 
},
]
dd_metadata = [
{
 metric  = "http.server.duration"
 unit  = "millisecond"
 type  = "gauge" 
},

{
 metric  = "http.server.request_content_length"
 type  = "count" 
},

{
 metric  = "http.server.response_content_length"
 type  = "count" 
},
]

dd_downtime = [
{
 scope = ["functionname:metrics-decoding-test"]
 monitor_id = 156896
 message = "Mute metrics-decoding-test"
 
}
]

metric_name = "kubernetes_state.node.ready"

alert_message = "Kubernetes Node not in Ready state  @pagerduty-Kubernetes"
 
critical_threshold = 3

name = " Kubernetes Node not ready"

include_tags = ["*"]

no_data_timeframe = 2

ok_threshold = 3

priority = 5

service = "[kubernetes]"
 
warning_threshold = 2
 
by_tags     = ["env","node"]
 
auto_resolve_time_h         = 1

new_group_delay  = 300


#Datadog log indexes control the log inflow into DD

log_indexes = {

  "prod-logs" = {
    "name" = "prod-logs",
    "daily_limit" = "400000000",
    "retention_days" = "15",
    "query" = "(kube_cluster_name:prod* kube_namespace:apps* -service:(agent OR cluster-agent OR opentelemetry* OR nginx* OR cert-manager*))",
    "exclusion_filter" = [
       {
        "name" = "exclude debug logs",
        "query" = "status:debug"
      },
      {
        "name" = "exclude lambda start message",
        "query" = "\"START RequestId:\""
      },
      {
        "name" = "exclude lambda end message",
        "query" = "\"END RequestId:\""
      },
      {
        "name" = "unable to ingest out of range data",
        "query" = "unable to ingest out of range data"
      },
     {
        "name" = "exclude lambda report message",
        "query" = "\"REPORT RequestId\""
      }
     ]
    },
  "non-prod-logs" = {
    "name" = "non-prod-logs"
    "daily_limit" = "400000000",
    "retention_days" = "15",
    "query" = "(kube_cluster_name:dev** kube_namespace:apps* -service:(agent OR cluster-agent OR opentelemetry* OR nginx* OR cert-manager*))",
    "exclusion_filter" = [
       {
        "name" = "exclude debug logs",
        "query" = "status:debug"
      },
      {
        "name" = "exclude lambda start message",
        "query" = "\"START RequestId:\""
      },
      {
        "name" = "exclude lambda end message",
        "query" = "\"END RequestId:\""
      },
      {
        "name" = "unable to ingest out of range data",
        "query" = "unable to ingest out of range data"
      },
     {
        "name" = "exclude lambda report message",
        "query" = "\"REPORT RequestId\""
      }
     ] 
 }
  "main" = {
    "name" = "main"
    "daily_limit" = "100000000",
    "retention_days" = "15",
    "query" = "service:(app1-critical)",
    "exclusion_filter" = [ ]
 }

}

slo_configs = {
  "api-gw-aws" = {
    name        = "API-GW SLO (AWS)"
    type        = "monitor"
    description = "This is an SLO Metric for API GW on AWS"
    monitor_ids = [156880]
    timeframe   = "30d"
    target_threshold  = 99.0
    warning_threshold = 99.2
    tags              = ["env:aws", "created-by:tf"]
    thresholds = {
      "30d" = {
        timeframe = "30d"
        target    = 99.0
        warning   = 99.2
      }
    }
  }

  "kong-api" = {
    name        = "Kong API SLO"
    type        = "metric"
    description = "This is an SLO Metric for Kong API"
    query = {
      values = {
       numerator = "sum:kong.request.count{!status:5*} by {env}.as_count()"
       denominator = "sum:kong.request.count{*} by {env}.as_count()"
    }
    }
    timeframe   = "30d"
    target_threshold  = 99.0
    warning_threshold = 99.2
    tags              = ["env:all", "created-by:tf"]
    thresholds = {
      "30d" = {
        timeframe = "30d"
        target    = 99.0
        warning   = 99.2
      }
    }
  }

  "kong-apigw-combined" = {
    name        = "Combined SLO for Kong and APIGW"
    type        = "metric"
    description = "This is an SLO Metric for Kong and APIGW"
    query = {
      values = {
       numerator = "(sum:aws.apigateway.count{*} by {env}.as_count() - sum:aws.apigateway.5xxerror{*} by {env}.as_count()) + sum:kong.request.count{!status:5*} by {env}.as_count()"
       denominator = "sum:aws.apigateway.count{*} by {env}.as_count() + sum:kong.request.count{*} by {env}.as_count()"
    }
    }
    timeframe   = "30d"
    target_threshold  = 99.0
    warning_threshold = 99.2
    tags              = ["env:all", "created-by:terraform"]
    thresholds = {
      "30d" = {
        timeframe = "30d"
        target    = 99.0
        warning   = 99.2
      }
    }
  }
}
