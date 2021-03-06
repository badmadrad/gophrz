#! /usr/bin/env sh

set -e

command_exists() {
  command -v "$@" > /dev/null 2>&1
}

user="$(id -un 2>/dev/null || true)"

sh_c='sh -c'
  if [ "$user" != 'root' ]; then
    if command_exists sudo; then
      sh_c='sudo -E sh -c'
    elif command_exists su; then
      sh_c='su -c'
    else
      cat >&2 <<-'EOF'
      Error: this installer needs the ability to run commands as root.
      We are unable to find either "sudo" or "su" available to make this happen.
EOF
      exit 1
    fi
  fi

# perform some very rudimentary platform detection
  lsb_dist=''
  if command_exists lsb_release; then
    lsb_dist="$(lsb_release -si)"
  fi
  if [ -z "$lsb_dist" ] && [ -r /etc/lsb-release ]; then
    lsb_dist="$(. /etc/lsb-release && echo "$DISTRIB_ID")"
  fi
  if [ -z "$lsb_dist" ] && [ -r /etc/debian_version ]; then
    lsb_dist='debian'
  fi
  if [ -z "$lsb_dist" ] && [ -r /etc/redhat-release ]; then
    lsb_dist='centos'
  fi
  if [ -z "$lsb_dist" ] && [ -r /etc/fedora-release ]; then
    lsb_dist='fedora'
  fi
  if [ -z "$lsb_dist" ] && [ "$(uname)" == "Darwin" ]; then
    lsb_dist='osx'
  fi
  if [ -z "$lsb_dist" ] && [ -r /etc/os-release ]; then
    lsb_dist="$(. /etc/os-release && echo "$ID")"
  fi


  lsb_dist="$(echo "$lsb_dist" | tr '[:upper:]' '[:lower:]')"
  case "$lsb_dist" in
    amzn|fedora|centos)
      $sh_c "yum clean expire-cache && yum -y install curl wget tar"
      $sh_c "wget -O /usr/bin/gophrz https://github.com/badmadrad/gophrz/raw/master/binary/gophrz";;
    ubuntu|debian|linuxmint)
      $sh_c "apt-get update && apt-get -y install curl wget tar"
      $sh_c "wget -O /usr/bin/gophrz https://github.com/badmadrad/gophrz/raw/master/binary/gophrz";;
    osx)
      $sh_c "wget -O /usr/bin/gophrz https://github.com/badmadrad/gophrz/raw/master/binary/gophrz-mac";;
  esac

$sh_c "chmod 755 /usr/bin/gophrz"
echo "gophrz installed!!"
exit 0


