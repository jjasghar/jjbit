Feature: A command line interface for jjbit
  In order to provide a quick and response development workflow
  I want a command line interface that has sane defaults and built in help

  # Scenario: Displaying help
  #   When I run `jjbit help`
  #   Then the exit status should be 0
  #   And the output should contain "jjbit --help"
  #   And the output should contain "jjbit --version"

  # Scenario: Displaying help
  #   When I run `jjbit --help`
  #   Then the exit status should be 0
  #   And the output should contain "jjbit --help"
  #   And the output should contain "jjbit --version"

  # Scenario: Displaying help
  #   When I run `jjbit -h`
  #   Then the exit status should be 0
  #   And the output should contain "jjbit --help"
  #   And the output should contain "jjbit --version"

  # Scenario: Displaying the version of jjbit
  #   When I run `jjbit version`
  #   Then the exit status should be 0
  #   And the output should contain "jjbit version"

  # Scenario: Displaying the version of jjbit
  #   When I run `jjbit --version`
  #   Then the exit status should be 0
  #   And the output should contain "jjbit version"

  Scenario: Displaying the version of jjbit
    When I run `jjbit -v`
    Then the exit status should be 0
    And the output should contain "jjbit version"

  # Scenario: Gets shortend url
  #   When I run `jjbit http://google.com`
  #   Then the exit status should be 0
  #   And the output should contain "http://bit.ly/1ra0tQp"

  # Scenario: Gets an expanded url
  #   When I run `jjbit http://bit.ly/1ra0tQp`
  #   Then the exit status should be 0
  #   And the output should contain "http://google.com"
