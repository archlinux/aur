
pre_remove()
{
    echo "Running openshift pre_remove script..."

    rm /usr/bin/kube-apiserver
    rm /usr/bin/kube-controller-manager
    rm /usr/bin/kubelet
    rm /usr/bin/kube-proxy
    rm /usr/bin/kube-scheduler
    rm /usr/bin/oadm
    rm /usr/bin/kubectl
    rm /usr/bin/openshift
    rm /usr/bin/oc

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
