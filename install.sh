
pre_remove()
{
    echo "Running openshift pre_remove script..."

    rm -f -- /usr/bin/kube-apiserver
    rm -f -- /usr/bin/kube-controller-manager
    rm -f -- /usr/bin/kubelet
    rm -f -- /usr/bin/kube-proxy
    rm -f -- /usr/bin/kube-scheduler
    rm -f -- /usr/bin/oadm
    rm -f -- /usr/bin/kubectl
    rm -f -- /usr/bin/openshift
    rm -f -- /usr/bin/oc
    rm -f -- /usr/bin/kubefed

}

pre_upgrade() {
    pre_remove
}

post_upgrade() {
    post_install
}

post_install() {

    echo "Running openshift post_install script..."

    ln -s /usr/bin/openshift /usr/bin/kube-apiserver
    ln -s /usr/bin/openshift /usr/bin/kube-controller-manager
    ln -s /usr/bin/openshift /usr/bin/kubelet
    ln -s /usr/bin/openshift /usr/bin/kube-proxy
    ln -s /usr/bin/openshift /usr/bin/kube-scheduler
    ln -s /usr/bin/openshift /usr/bin/oadm
    ln -s /usr/bin/oc        /usr/bin/kubectl

}
