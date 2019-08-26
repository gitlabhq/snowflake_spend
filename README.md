# Snowflake Spend dbt Package

This is a [dbt](http://getdbt.com) package for understanding the cost your [Snowflake Data Warehouse](https://www.snowflake.com) is accruing.

To get started with this package, you will need to have access to the appropriate databases.

To grant appropriate roles for these tables the following command was run:
```
GRANT IMPORTED PRIVILEGES ON DATABASE snowflake TO ROLE <role>;
```

[Learn more about the appropriate permissions](https://docs.snowflake.net/manuals/user-guide/data-share-consumers.html#granting-privileges-on-a-shared-database).

dbt has great [docs on package management](https://docs.getdbt.com/docs/package-management).
We are working to get this package on the [dbt hub site](http://hub.getdbt.com).
In the mean time, you can install it using the git package syntax, which the GitLab data team uses in our [`packages.yml`](https://gitlab.com/gitlab-data/analytics/blob/master/transform/snowflake-dbt/packages.yml) file

```
packages:
  - git: https://gitlab.com/gitlab-data/snowflake_spend.git
    revision: v1.0.0
```

You will need to update your `dbt_project.yml` to enable this package.
You can see [how the GitLab data team has this configured](https://gitlab.com/gitlab-data/analytics/blob/master/transform/snowflake-dbt/dbt_project.yml).

```
snowflake_spend:
  enabled: true
```

You will need a csv called `snowflake_contract_rates.csv` which has two columns: effective date and rate. The effective date is the day the new contracted rate started and it should be in YYYY-MM-DD format. The rate is the per credit price for the given time period. You can see how the data team configures [their csv file](https://gitlab.com/gitlab-data/analytics/blob/master/transform/snowflake-dbt/data/snowflake_contract_rates.csv). You will need to run `dbt seed` for the csv to be loaded as a table and for the model to run succesfully.

These models are documented and tested.
If you'd like to see what these look like live, you can see them in [the GitLab Data Team's public dbt docs](https://gitlab-data.gitlab.io/analytics/dbt/snowflake/#!/model/model.snowflake_spend.snowflake_warehouse_metering_xf).

Big thanks to @tayloramurphy, who did most of the heavy lifting here.

We include sample Periscope dashboards in the `/analytics` folder.

This dbt package is made available by the GitLab Data Team under an MIT License.

## Troubleshooting

**Error: _Found duplicate project dbt_utils. This occurs when a dependency has the same project name as some other dependency._**

You are most likely referencing dbt-utils using the git/revision syntax. Use the dbt Hub package syntax instead in your `packages.yml`, eg:

```
packages:

  # Avoid this
  - git: "https://github.com/fishtown-analytics/dbt-utils.git"
    revision: 0.2.1

  # Use this instead
  - package: fishtown-analytics/dbt_utils
    version: 0.2.1
```
