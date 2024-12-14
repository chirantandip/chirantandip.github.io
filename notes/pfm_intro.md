---
documentclass: report
title: The Phase-Field Method
author: Chirantandip Mahanta
numbersections: true
---

The Fundamentals of Phase Field {#tfpf}
===========================

> This chapter is a compilation of the fundamental concepts in Phase-Field Theory. (The Notes are still in making).

Introduction
----------------

The phase-field is a thermodynamics-based method mostly used to model
phase changes and microstructure evolution in materials. It is a
mesoscopic method, meaning intermediate size. It deals with material
systems between the nano-scale and a few micrometers. The variables used
can be abstract non-conserved quantities representing a phase or
anything (for example, a variable $x$ such that $x=0$ is a solid, $x=1$
is a liquid and $x \in (0,1)$ is an interface between the two), or they
can be conserved measurable quantity such as concentration.

The principle variable in such a model, that determines the state of a
system is called and order parameter.

The state of a system is captured in a variable, which is most often a
scalar field, a continuous function of position and time, and that
represents a property of the system such as concentration or phase
identity. Such a variable is called an Order parameter, and let's denote
it with $\phi(r,t)$. The value of $\phi$ at each position and time is
determined from the free energy of the system. If in addition of energy
conservation, $\phi(r,t)$ must itself remain conserved throughout its
time evolution, it is called a conserved order parameter, for example
the concentration field is conserved by the law of conservation of mass.
Parameters like phase identity, grain orientation etc. that do not obey
any conservation law are called non-conserved order parameters.

The time evolution of a both kinds of order parameters are governed by
two different equations.

### The Allen-Cahn equation

Let $\phi$ be the non-conserved order parameter. The free energy density
of a phase can be expressed as a function $f(\phi)$ which depends only
on the state of the system (T and P) at each point. Each value of $\phi$
represents a phase, let's say $\phi=0$ is solid and $\phi=1$ is liquid,
then only at the solid-liquid interface $\phi$ will have a non-zero
gradient. In this method, interfaces between phases are detected by
taking the gradient of the order parameter, $\phi$.

The total energy of the system is a sum of both bulk and interfacial
energy. Bulk energy distribution is given by a function $f(\phi)$ and
the interfacial energy is assumed to vary linearly with
$|\nabla\phi|^2$. Higher the gradient of $\phi$, more discontinuous the
interface and higher the interfacial energy. The free energy functional
is expressed as:

$$F = \int_V \left[ f(\phi) + \frac{\epsilon}{2}\left|\nabla\phi \right|^2 \right] dv$$

where $\epsilon$ is the constant that determines the interfacial free
energy. The functional represents the volumetric total of the free
energy of the system. And what should happen to the total free energy as
time goes by, it should decrease. So, at equilibrium, $F$ should be in
its minimum value, and the $\phi$ that minimizes $F$ is the $\phi$ at
equilibrium. That is the $\phi$ we are looking for. Now, how to minimize
a functional, equate its derivative to 0, yes. But, taking the
derivative of a functional has to do with the calculus of variations and
is beyond the scope of the present work.

The differential equation obtained as a result of minimizing the total
free energy of the system is called the Allen-Cahn equation. This
equation governs the evolution of a non-conserved order parameter. It is
expressed as:

$$\frac{\partial \phi(r,t)}{\partial t} = -L_\phi \left[ \frac{\partial f(\phi)}{\partial \phi} - \epsilon \nabla^2 \phi(r,t) \right]$$

here $L_\phi$ is a constant. The key assumptions for this equation to
hold are:

-   The interfaces are diffuse. $\phi$ has continuous values across them.
-   The Higher-order terms in the taylor expansion of the free energy density $f(\phi)$ are negligible.
-   $\phi$ will change with time to decrease the total free energy of the system.
-   Thermodynamics is the only driving force for change. No other forces like electromagnetism are at play.

These assumptions are also a must for the evolution of conserved order
parameters as well.

### The Cahn-Hilliard equation

A conserved order parameter demands a conservation law to be imposed on
top of the condition of total free energy minimization of the system.
The conservation of most quantities are governed by the mathematical
laws as those of mass conservation, namely the Fick's laws of diffusion
which are expressed as:

$$\frac{\partial \phi}{\partial t} = -\nabla J \hspace{1cm}: J = -M\nabla \mu \hspace{1cm}$$

where J is the mass flux, M is the mobility of the material and $\mu$ is
the chemical potential which is defined as:

$$\mu = \frac{\partial f(\phi)}{\partial \phi} - \epsilon \nabla^2 \phi(r,t)$$

Combining the two conditions, one can derive the differential equation
governing the time evolution of a conserved order parameter, which is
the Cahn-Hlliard equation. It is expressed as:

$$\frac{\partial\phi(r,t)}{\partial t}=\nabla . \left( M \nabla . \left( \frac{\partial f}{\partial \phi} - \epsilon \nabla^2 \phi \right) \right)$$
Where $M$ is the mobility and $\epsilon$ determines the interfacial free
energy. $M$ can be taken out of the gradient operator when it is a
scalar and then we will get a laplacian operating on the inner brackets.

Kobayashi dendrite growth
-------------------------

The simplest of all is the renowned work of Kobayashi [@Kobayashi1993]
which is one of the earliest phase-field models for dendritic
solidification.

The model includes two order parameters. One is a non-conserved order
parameter $\phi(r,t)$ which takes the value of 1 in solid phase and 0 in
liquid phase. The other parameter is the temperature field $T(r,t)$.
Here $r$ is the spatial position and $t$ is time.

The free energy functional chosen for this model is the Ginzburg-Landau
type free energy including $m$ as a parameter :

$$F(\phi,m) = \int_V \frac{1}{2} \epsilon^2 |\nabla \phi|^2 + f(\phi,m)dv ;$$

where $\epsilon$ is a small parameter which determines the thickness of
the layer and also controls the mobility of the interface. $f$ is a
double well potential (free energy function) that has local minima at
$\phi=0$ and $\phi=1$ for each value of $m$. The specific form of $f$
taken in this model is :

$$f(\phi,m) = \frac{1}{4}\phi^4 + (\frac{1}{2} - \frac{1}{3}m)\phi^3 + (\frac{1}{4} - \frac{1}{2}m)\phi^2$$

where $|m|<\frac{1}{2}$. Anisotropy is accounted for by assuming that
$\epsilon$ depends on the direction of the outer normal vector at the
interface. Its value is calculated as :

$$\epsilon = \bar{\epsilon}\sigma(\theta)$$

where $\bar{\epsilon}$ is the mean value and $\sigma(\theta)$ represents
anisotropy in the form :

$$\sigma(\theta) = 1 + \delta \cos{j(\theta - \theta_0)} \; \; \text{ with } \; \; \theta = \arctan{ \left(\frac{\partial \phi / \partial y}{\partial \phi/ \partial x} \right)}$$

where $\delta$ is the strength of anisotropy and $j$ is the mode number
of anisotropy which takes the value of 4 for cubic lattices and 6 for
hexagonal lattices. $\theta_0$ is the initial offset angle taken as a
constant.

The parameter $m$ is assumed to be dependent on the degree of
supercooling an the temperature. The dependency is expressed as :

$$m(T) = \frac{\alpha}{\pi} \arctan{[ \gamma (T_{eq}-T } ]$$

where $\alpha$ is a positive constant and $T_{eq}$ is the equilibrium
temperature. The Allen-Cahn equation for the evolution of the
non-conserved order parameter $\phi$ takes the respective forms as
expressed above.

The temperature field evolution equation is derived from enthalpy
conservation and is expressed as :

$$\frac{\partial T}{\partial t} = \nabla^2T + \kappa\frac{\partial \phi}{\partial t}$$

The equation is non-dimentionalized so that the characteristic cooling
temperature is 0 and the equilibrium temperature is 1.

The isotropic phase field evolution equation is :

$$\tau\frac{\partial \phi}{\partial t} =  \epsilon^2\nabla^2\phi + \phi(1-\phi)(\phi- \frac{1}{2} +m )$$

The phase field $\phi$ evolution equation for anisotropic solidification
is expressed as:

$$\tau\frac{\partial \phi}{\partial t} = \frac{\partial}{\partial y} \left( \epsilon \frac{\partial\epsilon}{\partial\theta} \frac{\partial\phi}{\partial x} \right)- \frac{\partial}{\partial y} \left( \epsilon \frac{\partial\epsilon}{\partial\theta} \frac{\partial\phi}{\partial y} \right) + \nabla . (\epsilon^2\nabla\phi) + \phi(1-\phi)(\phi -\frac{1}{2} +m)$$

This model is henceforth referred to as 'KOB'.

 The WBM Model 
-------------

The next important advance was made by Wheeler, Boettinger and McFadden
[@Wheeler1992] and the model came to be known as WBM. The model
describes isothermal phase transitions between ideal binary-alloy liquid
and solid phases.

Extending on the KOB model, the free energy of an isothermal solid
solution in which the two solutes are assumed to be ideal solutions is
derived. It is assumed that the freezing temperature of the solution is
between the freezing temperatures of the pure elements (a lens phase
diagram). Further, the Helmholtz free energy of the components are
assumed to be of the form :

$$f_A(\phi; T) = W_A \int_0^{\phi} p(p-1)\left[p - \frac{1}{2} - \beta_A(T)\right] dp,$$
where $W_A$ is a constant, $T$ is a isothermal parameter and
$\beta_A(T)$ is a monotonically increasing function of temperature
capturing the effects of undercooling. The free energy density of the
solution is derived to be :

$$f(\phi, c; T) = cf_B + (1 - c) f_A + \frac{RT}{v_m} \left[ c \ln c + (1 - c) \ln (1 - c) \right]$$

where $R$ is the universal gas constant and $v_m$ is
the molar volume assumed to be a constant. The free energy functional
defined in terms of above equation is :

$$F[\phi, c; T] = \int_{V} \left[ f(\phi, c; T) + \frac{\epsilon^2}{2} |\nabla \phi|^2 \right] dv
\label{eq:wbmF}$$

Taking the variational derivative of the free energy functional gives the following governing equations:

$$\frac{\partial \phi}{\partial t} = M_1 \left[ \epsilon^2 \nabla^2 \phi - \left( c \frac{\partial f_B}{\partial \phi} + (1-c) \frac{\partial f_A}{\partial \phi} \right) \right]$$

$$\frac{\partial c}{\partial t} = M_2 \nabla \cdot \left[ c(1 - c) \nabla (f_B - f_A) \right] + D \nabla^2 c$$

where $D=M_2RT/v_m$ is the diffusivity of the solute $B$ assumed to be
constant and equal in both solid and liquid. And $M_1$ and $M_2$ are
constants related to mobilities of phase and concentration fields.

The model can reproduce correctly the solute trapping phenomena at a
high interface velocity. But the drawback of the model is that the
microstructure parameters vary depending on the interface thickness and
the presence of anomalous interface effects.

The next change is axiom was when Steinbach [@Steinbach1999] assumed the
interface to be a mixture of solid and liquid phases with different
compositions, but constant in their ratio (partition coefficient). The
model only worked for dilute alloys.

Binary KKS Model
----------------

A different derivation of governing equations came from Losert
[@Losert1998]. It was long been realized that the governing equations
describing alloy solidification are similar to the ones corresponding to
pure material. Using this concept, Losert extended the thin-interface
PFM for a pure material to an alloy case. However, the model had two
unrealistic assumptions. The first is that the model assumed the
liquidus and solidus lines to be parallel. And secondly they assumed a
constant solute diffusivity throughout the system like in the WBM model.

Building on the approach of Losert, the first successful and widely
adopted model for binary-alloy solidification was presented by Seong
Gyoon Kim, Won Tae Kim and Toshio Suzuki [@Kim1999]. They utilized the
correspondence between the variables of enthalpy-temperature equations
and composition-chemical-potential equations to derive an alloy phase
field model from the phase field model of pure elements. An important
assumption of the model is the equality of chemical potentials of
components at the interface.[^1]

The Interface-Width Problem
---------------------------

> If the PFM interface width is of the order of a real interface, the
> needed computational mesh size for mesoscale simulation
> amplifies[@Karma1998]. If not, various anomalous interface effects are
> observed[@Almgren1999].

The problem of finite interface width is as such. Generally, a binary
PFM model consists of two equations. The phase-field evolution equation
and the concentration-field evolution equation (the diffusion equation).
There are three parameters in the phase-field equation with definite
relationships with interface's energy, width and mobility. For the
interface dynamics of the PFM to correspond to that of a real interface,
the relationships between the parameters need to be precisely
determined. One way to do so is to set the interface width of the PFM to
the value corresponding to that of a real interface. This demands the
grid size of the computational mesh to be even smaller, about $<1nm$.
Mesoscale simulations then become almost impossible owing to a needed
much larger grid size.

This restriction was overcome in a remarkable work of Karma and Rappel
[@Karma1998]. They showed that for the solidification of pure substances
which have the same heat capacities and thermal diffusivity in solid and
liquid forms, trhe dynamics of an interface with a vanishingly small
width (that is, classical sharp interface dynamics) can be described
correctly by a PFM with a finite thin interface width, given that a
novel relationship between the real interface mobility and phase-field
mobility is adopted. The interface width does need to be much smaller
than the characteristic length scales of the diffusion field as well as
the interface curvature.

The PFMs developed with this concept of finite interface width still
suffered from anomalous interface effects. This was shown by
Almgren[@Almgren1999]. The effects include a chemical potential jump at
the interface which causes an exaggerated solute-trapping effect. Such
effects only become significant with increasing interface width.

The Anti-trapping Solution
--------------------------

> All the anomalous interface effects could be suppressed by introducing
> an antitrapping current term into the diffusion equation[@Karma2001].

A solution was proposed by Karma[@Karma2001][@Echebarria2004]. To act
against the solute-trapping current driven by the chemical potential
gradient, an antitrapping current term was introduced to the diffusion
equation. This suppressed the anomalous interface effects.

Following these findings, a model new PFM was proposed[@Kim2004]. It is
based on the fact that all the anomalous interface effects originate
from the finite interface width in the diffusion equation, not in the
phase-field equation. The anomalous interface effects can then be
suppressed by decoupling the interface width $2\xi_d$ in the diffusion
equation from the width $2\xi_d$ in the phase-field equation and taking
the limit $2\xi_d \rightarrow 0$. In numerical computations, however,
the minimum $2\xi_d$ value which one can take appears to be slightly
above the grid size $\Delta x$. Therefore the solute-trapping phenomenon
persists to a certain extent, as long as $\Delta x$ in the computation
is much thicker than the real interface width.

Next was the derivation of a PFM for multi-component systems with
arbitrary thermodynamic properties under the equal chemical potential
condition. This was done by Kim[@Kim2007] and is discussed in detail in
Chapter [KKS](notes/pfm_kks.html).



References
==========