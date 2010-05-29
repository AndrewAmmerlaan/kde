# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KMNAME="kdesdk"
KMMODULE="strigi-analyzer"
inherit kde4-meta

DESCRIPTION="kdesdk: strigi plugins"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	app-misc/strigi
"
RDEPEND="${DEPEND}"
