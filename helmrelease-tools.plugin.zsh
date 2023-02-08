function _hr_getYaml() {
  local yaml="$1"
  local index="$2"
  local kind="$3"

  <<<"$yaml" | yq -erys "[.[] | select(.kind == \"$kind\")][$index]"
}

function _hr_getNamespace() {
  local yaml="$1"

  <<<"$yaml" | yq -er '.spec.targetNamespace // .metadata.namespace'
}

function _hr_getReleaseName() {
  local yaml="$1"
  local ns

  if <<<"$yaml" | yq -e '.apiVersion == "helm.fluxcd.io/v1" or .spec.targetNamespace' > /dev/null; then
    <<<"$yaml" | yq -er ".spec.releaseName // \"$(_hr_getNamespace "$yaml")-\\(.metadata.name)\""
  else
    <<<"$yaml" | yq -er '.spec.releaseName // .metadata.name'
  fi
}

function _parse_hr_subcommand() {
  local subCommand="${1?}"
  local commands=()
  case "$subCommand" in
    template)
      commands+=("template")
      ;;
    diff)
      commands+=("diff" "upgrade" "--show-secrets" "--color" "--output=dyff")
      ;;
    install)
      commands+=("install")
      ;;
    upgrade)
      commands+=("upgrade")
      ;;
    uninstall)
      commands+=("uninstall")
      ;;
    *)
      echo "command '$subCommand' is not implemented" > /dev/stderr
      return 1
      ;;
  esac
  echo "${commands[@]}"
}

function _hr_git() {
  local subCommand="$1"
  local commands=()
  local gitUrl="$2"
  local gitRef="$3"
  local gitPath="$4"
  local namespace="$5"
  local releaseName="$6"
  local values="$7"

  commands=($(_parse_hr_subcommand "$subCommand"))
  [[ $? != 0 ]] && return 1

  rm -rf /tmp/helm-chart
  (
    git clone -q "$gitUrl" /tmp/helm-chart
    cd /tmp/helm-chart
    git checkout -q "$gitRef"
  ) > /dev/null

  helm dependency update "/tmp/helm-chart/$gitPath" > /dev/null
  helm "${commands[@]}" --namespace $namespace $releaseName "/tmp/helm-chart/$gitPath" --values <(<<< "$values") ${@:8}
  rm -rf /tmp/helm-chart
}

function helmrelease() {
  local subCommand="${1?You need to set the command}"
  shift
  local commands=()
  local namespace
  local releaseName
  local helmReleaseYaml
  local numberOfHelmReleases
  local values
  local index=0
  local sourceParameter
  local yaml
  commands=($(_parse_hr_subcommand "$subCommand"))

  while [[ "$#" != 0 ]]; do
    case "$1" in
      -)
        yaml=$(cat)
        shift
        ;;
      -+([0-9]))
        index="${1/-/}"
        shift
        ;;
      -ALL)
        index=ALL
        shift
        ;;
      --)
        shift
        break
        ;;
      *)
        if [[ -f "$1" ]]; then
          yaml=$(cat "$1")
        elif [[ -d "$1" ]]; then
          sourceParameter="$1"
        elif [[ "$1" =~ ^https://* ]]; then
          sourceParameter="$1"
        else
          echo "parameter '$1' is not supported" > /dev/stderr
          return 1
        fi
        shift
        ;;
    esac
  done

  if [[ -z "$yaml" ]]; then
    yaml=$(cat)
  fi

  numberOfHelmReleases=$(<<< "$yaml" | yq -ers '[.[] | select(.kind == "HelmRelease")] | length')
  if [[ "$numberOfHelmReleases" -lt 1 ]]; then
    echo "There are no HelmReleases in the input" > /dev/stderr
    return 1
  elif [[ "$numberOfHelmReleases" != 1 ]] && [[ "$subCommand" == "install" ]]; then
    echo "You can only install 1 HelmReleases at the same time" > /dev/stderr
    return 1
  elif [[ "$numberOfHelmReleases" -gt 1 ]] && [[ "$index" = "ALL" ]]; then
    <<<"$yaml" | yq -erys '.[] | select(.kind != "HelmRelease") | select(.)' \
      | if [[ "$subCommand" = "template" ]]; then
          cat -
        elif [[ "$subCommand" = "diff" ]]; then
          kubectl diff -f - || true
        fi
    for index in {0..$((numberOfHelmReleases - 1))}; do
      if [[ "$subCommand" = "template" ]]; then
        echo ---
      fi
      <<<"$yaml" | yq -erys '([.[] | select(.kind == "HelmRelease")]['"$index"']),(.[] | select(.kind | IN(["GitRepository", "HelmRepository"][])))' | helmrelease "$subCommand" -
    done
  fi

  helmReleaseYaml=$(_hr_getYaml "$yaml" "$index" HelmRelease)
  [[ "$?" -ne 0 ]] && return 1
  namespace=$(_hr_getNamespace "$helmReleaseYaml")
  releaseName=$(_hr_getReleaseName "$helmReleaseYaml")
  case "$subCommand" in
    uninstall)
      helm "${commands[@]}" --namespace $namespace $releaseName
      ;;
    *)
      values=$(<<< "$helmReleaseYaml" | yq -y -er .spec.values)
      if [[ -d "$sourceParameter" ]]; then
        helm "${commands[@]}" --namespace $namespace $releaseName "$sourceParameter" --values <(<<< "$values") ${@}
      elif <<< "$helmReleaseYaml" | yq -e '.apiVersion == "helm.fluxcd.io/v1"' > /dev/null; then
        if <<< "$helmReleaseYaml" | yq -e .spec.chart.git > /dev/null; then
          local gitPath
          local gitUrl
          local gitRef
          gitPath="$(<<< "$helmReleaseYaml" | yq -er '.spec.chart.path // "."')"
          gitUrl="$(<<< "$helmReleaseYaml" | yq -er .spec.chart.git)"
          gitRef="$(<<< "$helmReleaseYaml" | yq -er '.spec.chart.ref // "master"')"
          _hr_git "$subCommand" "$gitUrl" "$gitRef" "$gitPath" "$namespace" "$releaseName" "$values" "$@"
        else
          helm "${commands[@]}" --namespace $namespace --repo $(<<< "$helmReleaseYaml" | yq -er .spec.chart.repository) $releaseName $(<<< "$helmReleaseYaml" | yq -er .spec.chart.name) --version $(<<< "$helmReleaseYaml" | yq -er .spec.chart.version) --values <(<<< "$values") "$@"
        fi
      else
        local sourceNamespace
        local sourceName
        local sourceKind
        local sourceResource
        local chartName
        local helmRepositoryUrl
        sourceNamespace=$(<<< "$helmReleaseYaml" | yq -er ".spec.chart.spec.sourceRef.namespace // \"$namespace\"")
        sourceName=$(<<< "$helmReleaseYaml" | yq -er .spec.chart.spec.sourceRef.name)
        sourceKind=$(<<< "$helmReleaseYaml" | yq -er .spec.chart.spec.sourceRef.kind)
        if [[ -z "$sourceParameter" ]]; then
          local sourceYaml
          sourceYaml=$(_hr_getYaml "$yaml" "" "$sourceKind")
          sourceResource=$(<<< "$sourceYaml" | yq -erys "[.[] | select( (.metadata.namespace == \"$sourceNamespace\") and (.metadata.name == \"$sourceName\") )][0]")
          if [[ "$?" != 0 ]]; then
            sourceResource=$(kubectl --namespace=$sourceNamespace get $sourceKind $sourceName -o yaml)
            if [[ "$?" != 0 ]]; then
              helmRepositoryUrl="https://teutonet.github.io/teutonet-helm-charts"
              echo "Source resource '$sourceNamespace/$sourceKind/$sourceName' not found in cluster nor in input" > /dev/stderr
              vared -p "Please specify Helm Repository URL: " helmRepositoryUrl > /dev/null
              sourceKind=HelmRepository
              sourceResource=$'spec:\n  url: '"$helmRepositoryUrl"
            fi
          fi
        elif ! [[ -z "$sourceParameter" ]]; then
          sourceResource=$'spec:\n  url: '"$sourceParameter"
        fi
        chartName="$(<<< "$helmReleaseYaml" | yq -er .spec.chart.spec.chart)"
        case "$sourceKind" in
          GitRepository)
            local gitUrl
            local gitRef
            gitUrl="$(<<< "$sourceResource" | yq -er .spec.url)"
            gitRef="$(<<< "$sourceResource" | yq -er '.spec.ref | if .branch then .branch elif .tag then .tag elif .semver then .semver elif .commit then .commit else "master" end')"
            _hr_git "$subCommand" "$gitUrl" "$gitRef" "$chartName" "$namespace" "$releaseName" "$values" "$@"
            ;;
          HelmRepository)
            local chartVersion
            helmRepositoryUrl="$(<<< "$sourceResource" | yq -er .spec.url)"
            chartVersion="$(<<< "$helmReleaseYaml" | yq -er '.spec.chart.spec.version // "x.x.x"')"
            helm "${commands[@]}" --namespace $namespace --repo "$helmRepositoryUrl" $releaseName "$chartName" --version "$chartVersion" --values <(<<< "$values") "$@"
            ;;
          *)
            echo "'$sourceKind' is not implemented" > /dev/stderr
            return 1
            ;;
        esac
      fi
      ;;
  esac
}

function hr() {
  helmrelease "template" "$@"
}

function hrDiff() {
  HELM_DIFF_USE_UPGRADE_DRY_RUN=true helmrelease "diff" "$@"
}

function hrUpgrade() {
  helmrelease "upgrade" "$@"
}

function hrUninstall() {
  helmrelease "uninstall" "$@"
}

function hrInstall() {
  helmrelease "install" "$@"
}
