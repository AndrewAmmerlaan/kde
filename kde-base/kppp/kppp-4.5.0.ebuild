# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KMNAME="kdenetwork"
inherit kde4-meta

DESCRIPTION="KDE: A dialer and front-end to pppd."
KEYWORDS=" ~amd64  ~ppc ~ppc64  ~x86"
IUSE="debug +handbook"

RDEPEND="
	net-dialup/ppp
"
