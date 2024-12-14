---
documentclass: report
title: The Phase-Field Method
author: Chirantandip Mahanta
numbersections: true
---

The KKS Model {#kks}
=============

> This Chapter presents a summary of the Kim-Kim-Suzuki Model. (The Notes are still in making.)

The Binary Solidification Model
-------------------------------

This phase field model was first proposed in the paper [@Kim1999] as a
binary model for solidification of multicomponent systems. Since then it
has been developed and applied to study and model a range of
microstructure evolution phenomenon from eutectic solidification to
precipitate growth.

The model is free from the limit in the interface thickness in the WBM
model, and the unrealistic assumptions made by Losert, and it correctly
generates the solute trapping phenomena at high interface velocity. A
few relevant points about the model are:

-   It is an isothermal model.

-   Defines n+1 components, and phases, solid and liquid.

-   $c_{iS}$, $c_{iL}$ represent mole fraction of $i$'th solute in solid
    and liquid, they are scalar fields.

-   The Helmholtz free energy of a phase $f^p = f(\{c_{ip}\})$, is a
    function of solute concentrations only.

-   The interface is defined as a mixture of solid and liquid phases.

-   The free energy at interface follows the mixture rule :
    $$f^{interface}=h(\phi)f^S + [1-h(\phi)]f^L$$

-   The concentration at interface also follows the mixture rule :
    $$c^{interface}=h(\phi)c^S + [1-h(\phi)]c^L$$

-   And $c_{iS}$ and $c_{iL}$ in a given point are restricted by the
    equal chemical potential condition.

-   The material properties are assumed to be independent of the
    composition.

The total free energy of the system:

$$F=\int_V \left( \frac{\epsilon^2}{2}|\nabla \phi|^2 + wg(\phi) + h(\phi)f^S + [1-h(\phi)]f^L \right)dV$$

where $\epsilon$ : gradient energy coefficient,
$g(\phi)=\phi^2(1-\phi)^2$ : double well potential and $w$ : potential
height.

Imposing the equal chemical potential condition upon the solid and
liquid phases at a point of the system has two advantages over the
traditional equal composition condition.

-   The first is the relaxation of the restriction on the interface
    width in computation.

-   The second is that the profile of the equilibrium phase-field
    gradient becomes symmetric, which suppresses the anomalous nonlinear
    part in the Gibbs--Thomson effect in the thin interface limit.

The phase-field and diffusion equations from the work of Kim[@Kim1999]
and Eiken[@Eiken2006] are presented here:

$$\frac{1}{M_\phi} \phi_t = \epsilon^2\nabla^2\phi
- W \frac{dg(\phi)}{d\phi} 
- \frac{dh_p(\phi)}{d\phi}\left( f^S - f^L + \sum_{i=1}^n(c_S - c_L)\tilde{\mu_i} \right)$$

where $\epsilon$ is the gradient energy coefficient, $M_\phi$ is the
mobility constant and $W$ is the double well potential barrier height.

The diffusion equation is as such:

$$\frac{\partial c_i}{\partial t} 
= \nabla \cdot \left(  h_d(\phi) \sum_{j=1}^n D^S_{ij} \nabla c_{jS} + [1-h_d(\phi)] \sum_{j=1}^n D^L_{ij} \nabla c_{jL}   \right)$$

A point to be noted is that, the concentrations of solid ($c_S$) and
liquid ($c_L$) are defined at a certain infinitesimal point which is
assumed to be a mixture of solid and liquid phases. Therefore the
equality of chemical potentials imposed is also local. The chemical
potential need not stay constant throughout the interfacial region. It
is only constant across the interface only at a thermodynamic
equilibrium state.

At the interfacial region the components also satisfy the equality of
chemical potential and the solute concentration is taken to be

$$c = h(\phi)c_{S} + (1-h(\phi))c_{L}$$
$$f^S_{c_S}[c_S(x,t)]=f^L_{c_L}[c_L(x,t)]$$

Assuming $g(\phi)=\phi^2(1-\phi)^2$, $\phi_0=1$ (solid) at $x=-\inf$ and
$\phi_0=0$ (liquid) at $x=+\inf$, the equilibrium profile solved for 1D
is given as:

$$\phi_0=\frac{1}{2}\left( 1 - \tanh\frac{\sqrt{w}}{\sqrt{2\epsilon}} x \right)$$

From $\phi_0$ we get the the interface energy $\sigma$ and interface
thickness $2\lambda$ to be
$$\sigma=\frac{\epsilon\sqrt{w}}{3\sqrt{2}} \; \; \; \; \; \; 2\lambda=\alpha\frac{\sqrt{2}\epsilon}{\sqrt{w}}$$

where $\alpha$ is a constant depending on the definition of interface
thickness. $\alpha=2.2$ when $\phi_0\in(0.1,0.9)$.

Introducing the Anti-trapping current
-------------------------------------

When we define a finite interface width, several anomalous interface
effects appear. This was shown my Almgren[@Almgren1999]. The effects can
be negated by using interpolation functions with specific symmetry but
it appears that all of them cannot be suppressed simultaneously.

For dilute binary alloys with $D_S<<D_L$, Karma solved this problem by
introducing an anti-trapping term in the diffusion equation [@Karma2001]
[@Echebarria2004]. Kim[@Kim2007] extend the anti-trapping method to the
cases of the arbitrary multi-component alloys. The assumption $D_S<<D_L$
is, however, was maintained because it allowed the concentration (or
chemical potential) profile at steady state to be determined
unambiguously.

The anti-trapping term is introduced to the diffusion equation as:

$$\frac{\partial c_i}{\partial t} = \nabla .[1-h_d(\phi)]\sum_{j=1}^n D_{ij}^L\nabla c_{jL} + \nabla \cdot \alpha_i\frac{\partial \phi}{\partial t}\frac{\nabla \phi}{|\nabla \phi|}
\label{eq:compevol}$$

where $\alpha_i$ is a function of $c_{iS}$ and $c_{iL}$, and $c_i$ is
given by $$c_i = h_r(\phi)c_{iS} + (1-h_r(\phi))c_{iL}$$

### Interpolation functions.

The three equations, phase evolution, diffusion equation and mass
conservation, have three different interpolation functions marked by
$p,d,r$. Even though a single function $h(\phi)$ must be adopted in the
rigorous thermodynamic derivation, it is not the case in mapping the
diffuse interface model onto the classical sharp interface model
[@Karma2001] [@Echebarria2004].

However, a specific symmetry in their functional forms must be imposed
in order to suppress the anomalous interface effects, such as interface
diffusion and interface stretching. This symmetry condition is
equivalent to the requirement that the positions of the effective sharp
interfaces for the driving force action ($h_p$), diffusivity change
($h_d$) and solute partitioning ($h_r$) must be in accordance with that
of the effective Gibbs--Thomson interface which is the symmetry axis
position of the potential $g(\phi)$. For the potential
$g(\phi)=\phi^2(1-\phi)^2$ having a symmetry axis at $x=1/2$, the simple
interpolation functions such as $\phi$ satisfy the symmetry condition.
Even after the choice of functions, there remains an anomalous interface
effect: the chemical potential jump at the effective sharp interface.

### Chemical potential jump.

Kim[@Kim2007] assumed that the interface width is sufficiently smaller
than the diffusion boundary layer width in liquid, that is, the thin
interface condition. Note that $c_{iS}$, $c_{iL}$ and $\tilde{\mu_i}$
are constrained by equality of chemical potential. If one of them is
known at a given point, the other two at that point are fixed by the
condition. For an interface with a finite width, there exist a finite
difference between $c_{iS}^+$ and $c_{iL}^-$. This makes a corresponding
difference in chemical potential, which has been called the chemical
potential jump[@Karma2001] [@Echebarria2004].

For multicomponent systems with arbitrary thermodynamic properties, as
for dilute binary alloys[@Karma2001] [@Echebarria2004] the chemical
potential jump can be suppressed by a suitable choice of the
interpolation functions and $\alpha(c_{iS}$, $c_{iL})$, that is, by
balancing the anomalous solute trapping arising from the diffusion
through the thick interface.

The procedure for balancing the solute trapping with the anti-trapping
current is straightforward.

1.  Find the composition profile $c_{iL}(x)$ by solving the steady-state
    diffusion equation.

2.  Extract the straight part from the profile $c_{iL}(x)$ and then get
    $c_{iS}^+$ and $c_{iL}^-$.

3.  Put $c_{iS}^+ = c_{iL}^-$ to determine the interpolation functions
    and $\alpha(c_{iS}$, $c_{iL})$ for the condition of vanishing
    chemical potential jump.

The interpolation functions are found to be $h_r(\phi)=h_d(\phi)=\phi$
and for a vanishing chemical potential jump the anti-trapping function
is given as

$$\alpha_i = \frac{\sqrt{2\omega}}{\epsilon}(c_{iL}-c_{iS})$$

The parameters $\epsilon$ and $\omega$ can be found from their
relationships with the interface width $2\xi$ and the interface energy
$\sigma$ in the equilibrium state:

$$2\xi=\frac{\epsilon}{\sqrt{2\varpi}}\int_{\phi_{a}}^{\phi_{b}}\frac{d\phi_{0}}{\phi_{0}(1-\phi_{0})}=\frac{\epsilon}{\sqrt{2\varpi}}ln\frac{\phi_{b}(1-\phi_{a})}{\phi_{a}(1-\phi_{b})}$$

$$\sigma=\epsilon^{2}\int_{-\infty}^{\infty}(\frac{d\phi_{0}}{dx})^{2}dx=\frac{\epsilon\sqrt{\varpi}}{3\sqrt{2}}$$

where $2\xi$ is defined as the width over which $\phi$ changes from
$\phi_a$ to $\phi_b$.

### Phase-Field Mobility

The phase-field mobility $M_\phi$ has a relationship with the interface
mobility $m$ defined by the ratio between the driving force and the
interface velocity. The procedure to find $M_\phi$ is as such:

1.  Find the profile $c_{iL}(x)$ under the condition
    $c_{iS}^+ = c_{iL}^-$ vanishing chemical potential jump.

2.  Then $c_{iS}(x)$ and $\tilde{\mu_i}$ follow from equality of
    chemical potential constraint.

3.  Insert the composition and chemical potential profiles into the
    driving force term of the phase-field equation and extract the new
    driving force for the effective sharp interface with the straight
    composition profiles in the interfacial region.

4.  The relationship between the new driving force and the interface
    velocity is found, which yields a relationship between the physical
    interface mobility $m$ and the phase-field mobility $M_\phi$ at the
    thin interface limit.

Ultimately it leads to:

$$f^{L,e} - f^{S,e} - \sum_{i=1}^n (c^e_{iL} - c^e_{iS}) \tilde\mu_i^0 = V \left( \frac{1}{M_\phi} \frac{\sqrt w}{3 \sqrt2 \epsilon} - a_2 \frac{\epsilon}{\sqrt{2 \sigma}} \zeta \right)$$

where $\zeta$ is defined as:
$$\zeta=\sum^n_{i=1}(c^e_{iL}-c^e_{iS})\sum^n_{j=1}f^{L,e}_{ij}\sum^n_{k=1}d^L_{jk}(c^e_{kL}-c^e_{kS})$$

This can be written into a compact form

$$\zeta = (\Delta c ] [G^L] [D^L]^{-1} [\Delta c) = (\Delta c] [M^L]^{-1} [\Delta c)$$
with the matrix notations: $(\Delta c] = c^e_{iL} -c^e_{iS}$,
$[G^L] = f^{L,e}_{ij}$ and $[M^L] = M^L_{ij}$.

In particular, for the infinite interface mobility, we obtain the
phase-field mobility

$$M_{0\phi} = \frac{W}{3 \cdot \epsilon_\phi^2 \cdot a_2 \cdot \zeta}
\hspace{1cm}$$

For binary alloys, the parameter $\zeta$ becomes
$$\zeta=\frac{(c^e_{1L}-c^e_{1S})f^{L,e}_{11}}{D^L_{11}}$$

Multi-Component extension
-------------------------

The KKS model discussed above is expanded to a multi-component system
with the following modifications.

The Phase-Evolution-Equation (Allen-Cahn Style) can be derived from the
variational derivative of the total free energy as such:

$$\frac{\partial \phi_p }{\partial t}
= -\frac{L}{N} \sum_{q\neq p}^{N}{\left[ \frac{\delta F}{\delta \phi_p} - \frac{\delta F}{\delta \phi_q}\right]}$$

The Diffusion-Equation becomes :

$$\frac{\partial c_i }{\partial t}
= \nabla \cdot \sum_{j=1}^{k-1} \left( M_{ij}(\phi) \nabla \mu_{ij} \right)$$
where 
$$M_{ij}(\phi) = \sum_{p=1}^{N} \left[
    h_p(\phi)\sum_{j=1}\left[D^p_{ik}\frac{d c_k}{d \mu_j}\right]
\right] \text{ : }
D_{ij} = M_{ik}\frac{\partial f}{\partial c_k \partial c_j}$$

The constraint imposed on the concentration fields are mass conservation
and equality of chemical potential implemented as such:

$$
c_j = \sum_{p=1}^{N} h(\phi_p)c^p_j ; 
\mu_j = \mu_i : \frac{\partial f^p}{\partial c^p_i} = \frac{\partial f^p}{\partial c^p_j}
$$

The multi-well potential is chosen to be:

$$g(\phi) = \sum_{i=1}^{N} q \gamma_i \phi_i^2(1-\phi_i)^2
+ \sum_{i=1}^{N} \sum_{j>i}^{N} \theta_{ij}\phi_i^2\phi_j^2 
+ \sum_{i=1}^{N} \sum_{j>i}^{N} \sum_{k>j}^{N} \theta_{ijk} \phi_i^2\phi_j^2\phi_k^2$$
or one can use the multi-obstacle potential.

The Phase-Field interpolation function is

$$h(\phi_p) = \phi^3 (1-15\phi + 6\phi^2)$$

References
==========