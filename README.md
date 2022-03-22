# hc-chart
common helm chart to universal deployment
it's pretty stable chart and we used it in our company permanently and moving old projects on it

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add kirosvi-charts https://kirosvi.github.io/hc-chart

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
kirosvi-charts` to see the charts.

To install the <chart-name> chart:

    helm install hc-chart kirosvi-charts/hc-chart

To uninstall the chart:

    helm delete hc-chart

## Features

- simplicity of adding additional pods/service/cronjob/ingress into deploy just with editing values.yaml
- simplicity of changing kubernetes api versions in one place. all you need to do after- update subchart in necessary repos and deploy them
- easily adding variables depends on environment
- by default you have podDisruptionBudget if pod have 2 and more replicas
- by default you have podAntiAffinity required by scheduling (most popular case, configuration of this maybe would be added later)
- by default in cronjobs enabled startingDeadlineSeconds (fixes problem with starting job if it had a lot of unsuccessful starts)
- you can enable or change many parameters of template via values

## Additional information

This project was created like inhouse solution to resolve the problem of updating numorouse of similarities written by scratch charts. We were tired of remembering where we have the latest templating features and some apocalypsis of upgrading a dozen charts when the kubernetes api has changed.

so because we have a lot of similar but different projects in several separated k8s clusters, it maybe has a few limitations which could be obstacles for you:

- we use environments approach "$TIER={stage|prod}" for variables
- in some cases it's important to us use branches approach for variables
- because of a confusing at stat of development this project it might have a few legacy solutions, that worked only for us (e.g using simplification for setting up nodeSelector and tolerations together)
- we tried to make this chart universal as we can, but work on them still in progress, so not all templates are great and identical
- maybe something else

## Issues

- not all functionality enabled in all templates
- some template have status work in progress, but they ready to work
- some functionality might not work or not exist in template



## Created by

[danuk](https://github.com/danuk)

[kirosvi](https://github.com/kirosvi)

