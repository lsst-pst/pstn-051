# maf_description_2020
Description of the metrics we plan to run on simulated surveys


# Intro

Run database available at:  http://astro-lsst-01.astro.washington.edu:8082/

To display the full MAF output in your browser, have the simulations stack installed--xxx add link and

> showMaf.py in this directory


# Basic Survey Properties

## Survey Depth

Compute the expected final coadded depth in each filter. 

<img src="glance/thumb.baseline_v1_4_10yrs_CoaddM5_r_HEAL_SkyMap.png" width="300"/>

## Number of Visits

Compute the total number of visits for each filter.
<img src="glance/thumb.baseline_v1_4_10yrs_Count_observationStartMJD_r_HEAL_SkyMap.png" width="300"/>

Also done in alt/az space (useful for checking that we are not oberving at high airmass)
<img src="glance/thumb.baseline_v1_4_10yrs_Nvisits_as_function_of_Alt_Az_r_HEAL_SkyMap.png" width="300"/>
## Filter distribution

Vizulization of what filters are loaded. Useful to see if redder filters are begin used in bright time and twilight.

<img src="glance/thumb.baseline_v1_4_10yrs_Hourglass_year_0-1_HOUR_Hourglass.png" width="300"/>
## Open Shutter Fraction

How much time is the camera shutter open compared to how much time is available. Drops when there is more slewing, more filter changing, or the shutter is closed for readout between snaps.

<img src="glance/thumb.baseline_v1_4_10yrs_OpenShutterFraction_ONED_BinnedData.png" width="300"/>
## Slew Stats

XXX--explain bumps at 40s, 120s, etc. 

<img src="glance/thumb.baseline_v1_4_10yrs_Slew_Time_Histogram_All_visits_ONED_BinnedData.png" width="300"/>
## Pair Fraction

The fraction of observations taken as pairs (e.g., can be used to identify moving objects)

<img src="glance/thumb.baseline_v1_4_10yrs_PairFraction_g_or_r_or_i_HEAL_SkyMap.png" width="300"/>
# SRD Metrics

## fO

How well do we meet the SRD requirement to observe 18,000 square degrees 825 times.


<img src="glance/thumb.baseline_v1_4_10yrs_fO_All_visits_HEAL_FO.png" width="300"/>
## Parallax and Proper Motion

Estimates of how precicely we can measure proper motion and parallax for an isolated point source.

<img src="glance/thumb.baseline_v1_4_10yrs_parallax_HEAL_SkyMap.png" width="300"/>
<img src="glance/thumb.baseline_v1_4_10yrs_properMotion_HEAL_SkyMap.png" width="300"/>

# Science Metrics



# Metrics that would be nice to have

## Photometric redshift

We currently don't have a measure of how well photometric redshift works. This metric would let us to better measure varying the filter distribution.

## LMC/SMC

We don't have any metrics specific to the LMC/SMC. 

## More Deep Drilling Science

We have the coadded depths, and number of SNe recovered. It would be nice to have other science case tests for the DDFs. This is useful for optimizing the DDF dithering strategy and overall cadence of DDF observations.

## AGN

