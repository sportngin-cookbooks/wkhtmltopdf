name              "wkhtmltopdf"
maintainer        "SportNgin"
license           "MIT"
description       "Installs a global executable for the `wkhtmltopdf` lib."
long_description  "Self continated recipe to build and install the linux wkhtmltopdf binary.  No external dependancies required."
version           "0.1.0"


recipe "wkhtmltopdf", "Installs the linux wkhtmltopdf binary"

supports "debian"
supports "ubuntu"
supports "centos"
supports "redhat"
supports "fedora"
