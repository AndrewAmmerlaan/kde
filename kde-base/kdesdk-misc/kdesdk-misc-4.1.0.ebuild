# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

KMNAME=kdesdk
KMNOMODULE="true"
inherit kde4-meta

DESCRIPTION="kdesdk-misc - Various files and utilities"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND="!kde-base/poxml"

# FIXME:
# currently doesn't do anything:
#	kdepalettes
# currently disabled on CMakeLists.txt
#	scheck
KMEXTRA="
	poxml/
	kprofilemethod/"
