# Estimate

Do you have a manager that's been nagging you about an end date or a project estimate?
**Estimate** can solve your problem.

## Usage

```ruby
gem install estimate # install

estimate <project_name> -u <username> -p <password> --ssl

Usage: estimate <project_name> [options]
    -u, --user STRING                Pivotal tracker username
    -p, --pass STRING                Pivotal tracker password
    -s, --ssl                        Use secure connection
    -d, --developers INT             Number of developers (default: 2)
    -x, --day_points INT             Points allocated to a day (default: 1)
```

[![Build Status](https://secure.travis-ci.org/despo/estimate.png)](http://travis-ci.org/despo/estimate)
