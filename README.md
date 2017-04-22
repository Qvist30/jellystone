## Synopsis
The Jellystone package contains models that can be used to model the what would happen to the polulations of the elk, coyote, and wolves if wolves were introduced to the park.

## Motivation
These are models for the Group 4 team of SYSEN 533 for PSU Spring 2017 semester. 

## Installation
You will need to have both MATLAB and SIMULINK to run these files.
Jellystone_v6 will execute as part of the executeModel.m file.

## Contributors
Thomas Kennedy
Matthew Ellis
Noriko Yao
Michael Cappiello

## Introduction
The purpose of our model is to determine the feasibility of reintroducing grey wolves to the fictional Jellystone National Park, home of the infamous Yogi Bear. Our model is based upon research performed prior to the reintroduction of wolves at the very real Yellowstone National Park.  The food chain is a delicate eco-system that adjusts to any minor adjustments in order to leverage the survivability for the majority of predators or prey. Our primary goal, aside from increased biodiversity of the Park, is to decrease the population of elk.  The elk population is estimated at 31,217 and we are hoping to have the elk population decrease, but by no more than 30% over the next 30 years.  Additionally, the coyote population is estimated at 2,017, and we are hoping to not decrease that population by more than 50%, while still introducing the grey wolf species to the park. Neither the elk nor the coyote population should increase over the long term over the course of next 30 years (2017-2047). The model and simulation will help us determine what ramifications the reintroduction of the grey wolf will have on our delicate ecosystem.

## Variables

| E | Estimated elk population (in thousands) | 31.217 (sometimes a random number within 10% of 31.217) | |
|C|Estimated coyote population (in thousands) |2.017 (sometimes a random number with 10% of 2.017)||
|W|Estimated wolf population (in thousands)|Ranges between 0 and 14||
|acreage|Number of acres elk may potentially graze on (in thousands)|19.68|Constant Value|
|G|Value between 0 and 1 representing the fraction of potentially grazeable acreage that is actually grazeable.|.8 (sometimes a random number with 10% of .8)||
|U|Value between 0 and 1 representing the fraction of potentially grazeable acreage that is not actually grazeable.|1-G|Always equal to 1-G|
|Rg|Intrinsic rate of growth of grazeable grass|0.27|constant|
|Ru|Intrinsic rate of growth of not grazeable grass|0.35|constant|
|qG|Competition coefficient of grazeable grass.|1.07|constant|
|qU|Competition coefficient of not grazeable grass|0.6|constant|
|B|Ratio between upper and lower bounds on qG and qU|0.3|constant|
|graze| Acre per year that an average elk requires for grazing|.492||

## Equations
The first two equations give us the change in land that is grazeable by the elk population, and land that is not grazeable by the elk population (Cooper & Huffaker 1997, p. 62-69).

		dG/dt= Rg*G*(1-G-qU*U*(B+(G/graze))/(1+G/graze))
Equation 1: Change in grazeable land

dW/dt = Ru * U * (1- U - qG*G*(1 + G/graze)/(B+G/graze))
Equation 2: Change in not grazeable land

The following three equations give us the change in populations of our respective animals: elk, coyotes, and wolves (Knickerbocker n.d., p 1).

If ((19.68G)/graze) > E:     dE/dt = E(0.004 - 0.003C - 0.85W)
If ((19.68G)/graze) <= E:     dE/dt = E( 0.003C - 0.85W)
Equation 3: Change in elk population

dC/dt = C(-.006+.001E)
Equation 4: Change in coyote population

dW/dt = W(-.12+.005E)
Equation 5: Change in wolf population

Finally, we created our grazing constant.  We estimated that of our population of elk, 70% of the population are cows, 13% of the population are bulls, and 17% of the population are calves (Liebenthal 2015).  Utilizing grazing rates where a mature cow uses 0.5 acres of grazeable land a year, a bull uses 0.7 acres of grazeable land a year, and a calf uses 0.3 acres of grazable land a year.  Doing this we end up with a grazing constant of 0.492.

graze = 0.5(cows/total)+0.7(bulls/total) + 0.3(calves/total)
Equation 6: Grazing Constant

## Conclusions
The introduction of grey wolves into Jellystone National Park will help to limit the populations of elk. The relationship between elk and wolves is cyclical. Both species will experience population highs and lows. Based on our model the extinction of coyotes from Jellystone is imminent and the introduction of grey wolves will only impact the year of the coyote extinction.

It’s possible that there is an issue with the model that we have for the coyote population, as no matter what we seem to do, they always seem doomed to extinction.  It is possible that the model is not accounting for an alternative food source, or perhaps the model for Yellowstone National Park that we have applied is not truly valid for Jellystone.  In fact, the only time the coyotes ever seem to be able to stay afloat, is when the elk population reaches 60,000 (which is beyond the capacity for Jellystone Park).  It just so happens that this is the initial elk population of the Yellowstone model that we applied to our simulation was 60,000.

If decreasing the elk population is indeed the most important thing that we need to do at Jellystone, then reintroducing wolves would probably be a good idea.  However, if we wish to try to keep the coyote population, we should probably determine what the best way is to save that species, before we introduce wolves.  Then again, perhaps we should leave the park to itself by following the advice of Capt. Kathryn Janeway of the Starship Voyager when she said “Who are we to swoop in, play god, and then continue on our way without the slightest consideration of the long-term effects of our actions?”



