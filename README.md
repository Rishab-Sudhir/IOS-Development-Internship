#Projects That i have worked on while on my IOS internship.

The biggest project i did was the BU AKPSI App which is an app that pulls data from a firebase realtime database that is intergrated
with a google sheets. It then presents this information in a scrolling format, where each item can be click and expanded.
It also includes a google sign in authorization module which only allows people from BU and AKPSI (an organization) to access the 
data.

Fi Demo Builds and IOS14 Search Bar were components that i tested before implementing in their app using GRPCs and their custom 
code.

In Fi Demo Builds there are 2 files EnachDemoBuild and EnachIntroDemoBuild. The EnachDemoBuild is simply some basic components layed
out in some vstacks and hstack. The EnachIntroDemoBuild is slightly more complicated, including a segment control component and 
a scroll view with components that change based on the segment selected. Also contains a linear gradient extension that just makes it
a bit simpler to create gradients on backgrounds.

IOS14 Search Bar is something i created because their app has to be compatible with IOS 14/15/16 so i had to make something
specifically compatible with IOS14.

The expandable cards file contains a rough idea of the way an expandable card would work, still needs modifications though
- Add a spacer to the bottom of the contentView that contains all the expandable cards, so that they stay are the top when
collapsed.
