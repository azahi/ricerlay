# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Generate and change colorschemes on the fly. A 'wal' rewrite in Python 3."
HOMEPAGE="https://github.com/dylanaraps/pywal"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/dylanaraps/${PN}.git"
else
  SRC_URI="https://github.com/dylanaraps/${PN}/archive/${PV}.tar.gz -> ${PV}.tar.gz"
fi

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
media-gfx/imagemagick
"

python_test() {
	nosetests || die "tests failed under ${EPYTHON}"
}
