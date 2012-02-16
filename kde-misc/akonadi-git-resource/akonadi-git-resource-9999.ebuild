# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_SCM="git"
inherit kde4-base

DESCRIPTION="Git commit integration in Akonadi"
HOMEPAGE="https://projects.kde.org/projects/playground/pim/akonadi-git-resource"
LICENSE="GPL-2"

SLOT="4"
KEYWORDS=""
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kdepimlibs semantic-desktop)
	=dev-libs/libgit2-0.15*
"
