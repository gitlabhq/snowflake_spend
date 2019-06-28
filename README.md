# snowflake_spend

This is a [dbt](http://getdbt.com) package for understanding the cost your [Snowflake Data Warehouse](https://www.snowflake.com) is accruing.

dbt has great [docs on package management](https://docs.getdbt.com/docs/package-management).

We are working to get this package on the [dbt hub site](http://hub.getdbt.com).
In the mean time, you can install it using the git package syntax, which the GitLab data team uses in our `[packages.yml](https://gitlab.com/gitlab-data/analytics/blob/master/transform/snowflake-dbt/packages.yml)` file

```
packages:
  - git: https://gitlab.com/gitlab-data/snowflake_spend.git
    revision: master
```

You will need to update your `dbt_project.yml` to enable this package.
You can see [how the GitLab data team has this configured](https://gitlab.com/gitlab-data/analytics/blob/master/transform/snowflake-dbt/dbt_project.yml#L82).

```
snowflake_spend:
  enabled: true
  vars:
    cost_per_credit: ## Add your cost per credit. This value does not need to be in quotes.
```

These models are documented and tested.
If you'd like to see what these look like live, you can see them in [the GitLab Data Team's public dbt docs](https://gitlab-data.gitlab.io/analytics/dbt/snowflake/#!/model/model.snowflake_spend.snowflake_warehouse_metering_xf).

Big thanks to @tayloramurphy, who did most of the heavy lifting here.

We include sample Periscope dashboards in the `/analytics` folder.

This dbt package is made available by the GitLab Data Team under an MIT License.
