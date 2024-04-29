# For runnig script from file

```
kubectl apply -f <filename>

or to set pod to the specific namespace

kubectl apply -f <filename> --namespace=<namespace_name>
```

# To see all namespaces

```
kubectl get namespaces
```

# To see all pods

```
kubectl get po -A
```

# To see logs

```
kubectl logs <pod_name> -n <namespace>
```

# Install ingress addon

```
minikube addons enable ingress
```

# To see ingresses

```
kubectl get ingress
```

# connect to the minikube

```
minikube ssh
```
