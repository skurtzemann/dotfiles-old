alias k="kubectl"

# Get objects
alias kg="kubectl get"
alias kgp="kubectl get pods"
alias kga="kubectl get all --all-namespaces"

# Describe
alias kd="kubectl describe"
alias kdp="kubectl describe pod"

# Delete
alias kdel="kubectl delete"
alias kdelp="kubectl delete pod"

# Create from a ressource file (imperative mode)
kc() {
	kubectl create -f $1
}

# Replace a ressource from a file (imperative mode)
kr() {
	kubectl replace -f $1
}

# Apply a configuration (declarative mode)
ka() {
	kubectl apply -f $1
}
kar() {
	kubectl apply -f $1 --recursive=true
}

# Exec a bash shell into the specify Pod
kep() {
	kubectl exec -it $1 sh
}

# Tail log from a specific object
klf() {
	kubectl logs -f $1
}


# Tools
alias h="helm"
alias kx="kubectx"
alias kns="kubens"
alias fx="fluxctl"
alias m="minikube"

fx-init() {
	flux_host=$(minikube ip)
	flux_port=$(kubectl get svc flux --template '{{ index .spec.ports 0 "nodePort" }}')
	export FLUX_URL=http://$flux_host:$flux_port/api/flux
	echo $FLUX_URL
}