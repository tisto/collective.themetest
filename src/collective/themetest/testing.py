from plone.app.testing import PloneSandboxLayer
from plone.app.testing import PLONE_FIXTURE
from plone.app.testing import IntegrationTesting
from plone.app.testing import FunctionalTesting
from plone.app.robotframework.testing import AUTOLOGIN_LIBRARY_FIXTURE

from plone.testing import z2

from zope.configuration import xmlconfig


class CollectivethemetestLayer(PloneSandboxLayer):

    defaultBases = (PLONE_FIXTURE,)

    def setUpZope(self, app, configurationContext):
        # Load ZCML
        import collective.themetest
        xmlconfig.file(
            'configure.zcml',
            collective.themetest,
            context=configurationContext
        )


COLLECTIVE_THEMETEST_FIXTURE = CollectivethemetestLayer()
COLLECTIVE_THEMETEST_INTEGRATION_TESTING = IntegrationTesting(
    bases=(COLLECTIVE_THEMETEST_FIXTURE,),
    name="CollectivethemetestLayer:Integration"
)
COLLECTIVE_THEMETEST_FUNCTIONAL_TESTING = FunctionalTesting(
    bases=(COLLECTIVE_THEMETEST_FIXTURE, z2.ZSERVER_FIXTURE),
    name="CollectivethemetestLayer:Functional"
)

COLLECTIVE_THEMETEST_ROBOT_TESTING = FunctionalTesting(
    bases=(
        COLLECTIVE_THEMETEST_FIXTURE,
        AUTOLOGIN_LIBRARY_FIXTURE,
        z2.ZSERVER_FIXTURE),
    name="CollectiveThemetest:Robot"
)
