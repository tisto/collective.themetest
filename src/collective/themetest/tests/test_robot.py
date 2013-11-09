from  collective.themetest.testing import COLLECTIVE_THEMETEST_FUNCTIONAL_TESTING
from plone.testing import layered
import robotsuite
import unittest


def test_suite():
    suite = unittest.TestSuite()
    suite.addTests([
        layered(robotsuite.RobotTestSuite("test_theme.robot"),
                layer=COLLECTIVE_THEMETEST_FUNCTIONAL_TESTING)
    ])
    return suite
