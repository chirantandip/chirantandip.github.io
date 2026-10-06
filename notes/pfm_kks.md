---
documentclass: report
title: The Phase-Field Method
author: Chirantandip Mahanta
numbersections: true
---

The KKS Model {#kks}
=============

> This chapter summarises the Kim-Kim-Suzuki (KKS) model. (These notes
> are still being written.)

The Binary Solidification Model
-------------------------------

The model was proposed by Kim, Kim and Suzuki [@Kim1999] for
solidification of binary alloys, and was later extended to
multicomponent alloys [@Kim2007]. It has since been used for a range of
microstructure problems, from eutectic solidification to precipitate
growth.

Its main advantage over the earlier WBM (Wheeler-Boettinger-McFadden)
model is that the interface width is no longer tied to the material
properties: in WBM the interface has to be made thin to avoid a
spurious extra interface energy, whereas in KKS it can be chosen freely
for numerical convenience. The model also reproduces solute trapping at
high interface velocities. Its main assumptions are:

-   The system is isothermal.

-   There are two phases, solid ($S$) and liquid ($L$), and $n+1$
    components ($n$ solutes and a solvent).

-   $c_{iS}$ and $c_{iL}$ are the mole fractions of solute $i$ in the
    solid and liquid. Both are fields, defined at every point including
    the interface.

-   The free energy density of each phase, $f^p(\{c_{ip}\})$, depends
    only on the composition of that phase.

-   A point in the interface is treated as a mixture of solid and
    liquid, so both the free energy and the composition are interpolated:
    $$f = h(\phi)f^S + [1-h(\phi)]f^L, \qquad c_i = h(\phi)c_{iS} + [1-h(\phi)]c_{iL}$$

-   At each point, $c_{iS}$ and $c_{iL}$ are related by equality of
    the diffusion potentials of the two phases (rather than by
    $c_{iS} = c_{iL}$, as in WBM).

-   Material properties do not depend on composition.

The total free energy is

$$F=\int_V \left( \frac{\epsilon^2}{2}|\nabla \phi|^2 + w\,g(\phi) + h(\phi)f^S(c_S) + [1-h(\phi)]f^L(c_L) \right)dV$$

where $\epsilon$ is the gradient energy coefficient,
$g(\phi)=\phi^2(1-\phi)^2$ is the double-well potential and $w$ its
height.

Imposing equal chemical potential, instead of equal composition, at
each point has two consequences:

-   The interface width can be chosen independently of the interface
    energy, because the chemical free energy no longer contributes an
    extra energy to the interface at equilibrium.

-   The equilibrium phase-field profile becomes symmetric, which removes
    the anomalous nonlinear part of the Gibbs-Thomson effect in the
    thin-interface limit.

For a binary alloy, with $\phi=1$ in the solid, the phase-field equation
is [@Kim1999]

$$\frac{1}{M_\phi} \frac{\partial\phi}{\partial t} = \epsilon^2\nabla^2\phi
- w \frac{dg}{d\phi}
- \frac{dh}{d\phi}\Big( f^S(c_S) - f^L(c_L) - (c_S - c_L)\,\tilde{\mu} \Big)$$

where $M_\phi$ is the phase-field mobility and $\tilde{\mu} =
f^S_c(c_S) = f^L_c(c_L)$ is the common diffusion potential. The term in
brackets is the difference in grand potential between solid and
liquid, i.e. the driving force for solidification. In the
multicomponent form [@Eiken2006; @Kim2007], $(c_S-c_L)\tilde{\mu}$
becomes $\sum_{i=1}^n(c_{iS} - c_{iL})\tilde{\mu}_i$.

The diffusion equation is

$$\frac{\partial c_i}{\partial t}
= \nabla \cdot \left(  h(\phi) \sum_{j=1}^n D^S_{ij} \nabla c_{jS} + [1-h(\phi)] \sum_{j=1}^n D^L_{ij} \nabla c_{jL}   \right)$$

Note that $c_{iS}$ and $c_{iL}$ are defined at every point of the
interface, and the equality of chemical potentials is a local
condition:

$$c = h(\phi)c_{S} + [1-h(\phi)]c_{L}, \qquad f^S_{c}[c_S(x,t)]=f^L_{c}[c_L(x,t)]$$

It does not mean that the chemical potential is uniform across the
interface. That is only true at equilibrium.

With $\phi=1$ (solid) at $x=-\infty$ and $\phi=0$ (liquid) at
$x=+\infty$, the 1D equilibrium profile is

$$\phi_0=\frac{1}{2}\left( 1 - \tanh\frac{\sqrt{w}}{\sqrt{2}\,\epsilon} x \right)$$

which gives the interface energy $\sigma$ and interface width $2\lambda$

$$\sigma=\frac{\epsilon\sqrt{w}}{3\sqrt{2}}, \qquad 2\lambda=\alpha\frac{\sqrt{2}\,\epsilon}{\sqrt{w}}$$

where $\alpha$ depends on how the width is defined; $\alpha \approx
2.2$ when the width is taken as the region $0.1<\phi_0<0.9$.

Introducing the Anti-trapping Current
-------------------------------------

A finite interface width gives rise to several spurious interface
effects, as shown by Almgren [@Almgren1999]: excess solute trapping,
surface diffusion along the interface, interface stretching, and a jump
in chemical potential across the interface. Some of these can be removed
by choosing interpolation functions with suitable symmetry, but not all
of them at the same time.

For dilute binary alloys with $D_S \ll D_L$, Karma solved this by adding
an anti-trapping current to the diffusion equation [@Karma2001;
@Echebarria2004]. Kim [@Kim2007] extended the approach to
multicomponent alloys with arbitrary thermodynamics. The assumption $D_S
\ll D_L$ was kept, because it lets the steady-state concentration (or
chemical potential) profile be determined unambiguously.

With $D_S$ neglected, the diffusion equation with the anti-trapping
term is

$$\frac{\partial c_i}{\partial t} = \nabla \cdot \left( [1-h_d(\phi)]\sum_{j=1}^n D_{ij}^L\nabla c_{jL} \right) + \nabla \cdot \left( \alpha_i\frac{\partial \phi}{\partial t}\frac{\nabla \phi}{|\nabla \phi|} \right)
\label{eq:compevol}$$

where $\alpha_i$ depends on $c_{iS}$ and $c_{iL}$, and

$$c_i = h_r(\phi)c_{iS} + [1-h_r(\phi)]c_{iL}$$

Since $\nabla\phi$ points into the solid and $\partial\phi/\partial t >
0$ during solidification, the added flux carries solute from the solid
side to the liquid side when $c_{iL} > c_{iS}$, counteracting the
trapping caused by the wide interface.

### Interpolation Functions

The phase-field equation, the diffusion equation and the mixture rule
for the composition now each have their own interpolation function,
labelled $h_p$, $h_d$ and $h_r$. A strictly variational derivation would
use a single $h(\phi)$, but this is not required when the goal is to
reproduce a given sharp-interface model in the thin-interface limit
[@Karma2001; @Echebarria2004].

The functions cannot be arbitrary, however. To remove anomalous
effects such as surface diffusion and interface stretching, the
effective sharp-interface positions associated with the driving force
($h_p$), the change in diffusivity ($h_d$) and the solute partitioning
($h_r$) must coincide with the effective Gibbs-Thomson interface, which
lies at the symmetry axis of $g(\phi)$. For $g(\phi)=\phi^2(1-\phi)^2$
the symmetry axis is $\phi=1/2$, and simple functions such as $h=\phi$
satisfy this condition. Even then, one anomalous effect remains: the
chemical potential jump at the effective sharp interface.

### Chemical Potential Jump

Kim [@Kim2007] assumes the thin-interface condition: the interface
width is much smaller than the diffusion boundary layer in the liquid.
Because $c_{iS}$, $c_{iL}$ and $\tilde{\mu}_i$ are linked by the
equal-chemical-potential condition, knowing one of them at a point fixes
the other two. For an interface of finite width, the concentration
extrapolated to the effective sharp interface from the solid side,
$c_{iS}^+$, differs from that extrapolated from the liquid side,
$c_{iL}^-$ (both expressed as liquid-equivalent compositions). This
gives a corresponding difference in chemical potential, called the
chemical potential jump [@Karma2001; @Echebarria2004].

As for dilute binary alloys, the jump can be removed for multicomponent
alloys with arbitrary thermodynamics by choosing the interpolation
functions and $\alpha_i$ so that the anti-trapping current exactly
balances the extra solute trapping caused by diffusion through the thick
interface. The procedure is:

1.  Solve the steady-state diffusion equation for the profile
    $c_{iL}(x)$.

2.  Extrapolate the straight (outer) parts of the profile to the
    interface to obtain $c_{iS}^+$ and $c_{iL}^-$.

3.  Set $c_{iS}^+ = c_{iL}^-$ and solve for the interpolation functions
    and $\alpha_i$ that make the jump vanish.

This gives $h_r(\phi)=h_d(\phi)=\phi$ and

$$\alpha_i = \frac{\epsilon}{\sqrt{2w}}(c_{iL}-c_{iS})$$

The parameters $\epsilon$ and $w$ are obtained from the interface width
$2\xi$ and interface energy $\sigma$ at equilibrium:

$$2\xi=\frac{\epsilon}{\sqrt{2w}}\int_{\phi_{a}}^{\phi_{b}}\frac{d\phi_{0}}{\phi_{0}(1-\phi_{0})}=\frac{\epsilon}{\sqrt{2w}}\ln\frac{\phi_{b}(1-\phi_{a})}{\phi_{a}(1-\phi_{b})}$$

$$\sigma=\epsilon^{2}\int_{-\infty}^{\infty}\left(\frac{d\phi_{0}}{dx}\right)^{2}dx=\frac{\epsilon\sqrt{w}}{3\sqrt{2}}$$

where $2\xi$ is the distance over which $\phi$ changes from $\phi_a$ to
$\phi_b$.

### Phase-Field Mobility

The phase-field mobility $M_\phi$ is related to the physical interface
mobility $m$, defined as the ratio of interface velocity to driving
force. It is found as follows:

1.  Find the profile $c_{iL}(x)$ under the condition $c_{iS}^+ =
    c_{iL}^-$ (no chemical potential jump).

2.  Obtain $c_{iS}(x)$ and $\tilde{\mu}_i(x)$ from the
    equal-chemical-potential condition.

3.  Substitute these profiles into the driving force term of the
    phase-field equation and extract the driving force acting on the
    effective sharp interface.

4.  Relate this driving force to the interface velocity $V$. This gives
    the relation between $m$ and $M_\phi$ in the thin-interface limit.

The result is

$$f^{L,e} - f^{S,e} - \sum_{i=1}^n (c^e_{iL} - c^e_{iS}) \tilde\mu_i^e = V \left( \frac{1}{M_\phi} \frac{\sqrt w}{3 \sqrt2\, \epsilon} - a_2 \frac{\epsilon}{\sqrt{2 w}} \zeta \right)$$

where the superscript $e$ denotes equilibrium values, $a_2$ is a
constant that depends on the choice of $g$ and the interpolation
functions, and

$$\zeta=\sum^n_{i=1}(c^e_{iL}-c^e_{iS})\sum^n_{j=1}f^{L,e}_{ij}\sum^n_{k=1}\left[(D^L)^{-1}\right]_{jk}(c^e_{kL}-c^e_{kS})$$

with $f^{L,e}_{ij} = \partial^2 f^L/\partial c_i\partial c_j$ at
equilibrium. In matrix form, with $\Delta\mathbf{c} = \mathbf{c}^e_L -
\mathbf{c}^e_S$, $\mathbf{G}^L = [f^{L,e}_{ij}]$ and $\mathbf{D}^L =
\mathbf{M}^L\mathbf{G}^L$,

$$\zeta = \Delta\mathbf{c}^T\,\mathbf{G}^L(\mathbf{D}^L)^{-1}\Delta\mathbf{c} = \Delta\mathbf{c}^T(\mathbf{M}^L)^{-1}\Delta\mathbf{c}$$

The left-hand side is the driving force, so the bracket on the right is
$1/m$. For an infinite interface mobility (diffusion-controlled growth)
the bracket must vanish, which gives

$$M_{\phi}^{0} = \frac{w}{3\,\epsilon^2 a_2 \zeta}$$

For a binary alloy,

$$\zeta=\frac{(c^e_{L}-c^e_{S})^2 f^{L,e}_{cc}}{D^L}$$

Multi-Component, Multi-Phase Extension
--------------------------------------

The model above can be extended to $N$ phases, each with its own phase
field $\phi_p$, and $k$ components.

The phase-field equations follow from the variational derivative of the
total free energy, written in the pairwise form commonly used for
multi-phase-field models:

$$\frac{\partial \phi_p }{\partial t}
= -\frac{L}{N} \sum_{q\neq p}^{N}{\left[ \frac{\delta F}{\delta \phi_p} - \frac{\delta F}{\delta \phi_q}\right]}$$

which keeps $\sum_p \phi_p = 1$.

The diffusion equation for the $k-1$ independent components is

$$\frac{\partial c_i }{\partial t}
= \nabla \cdot \sum_{j=1}^{k-1} M_{ij}(\phi) \nabla \mu_{j}$$

with the mobility interpolated between phases,

$$M_{ij}(\phi) = \sum_{p=1}^{N} h(\phi_p)\sum_{l=1}^{k-1} D^p_{il}\frac{\partial c^p_l}{\partial \mu_j}$$

which is the multicomponent form of $D = M\,\partial^2 f/\partial c^2$.

The phase compositions are constrained by mass balance and by equal
diffusion potentials in all phases:

$$c_j = \sum_{p=1}^{N} h(\phi_p)c^p_j, \qquad \frac{\partial f^p}{\partial c^p_j} = \frac{\partial f^q}{\partial c^q_j} = \mu_j \quad \text{for all phases } p, q$$

A common choice of multi-well potential is

$$g(\phi) = \sum_{i=1}^{N} \gamma_i \phi_i^2(1-\phi_i)^2
+ \sum_{i=1}^{N} \sum_{j>i}^{N} \theta_{ij}\phi_i^2\phi_j^2
+ \sum_{i=1}^{N} \sum_{j>i}^{N} \sum_{k>j}^{N} \theta_{ijk} \phi_i^2\phi_j^2\phi_k^2$$

where the higher-order terms suppress spurious third phases in two-phase
interfaces. A multi-obstacle potential can be used instead.

A common interpolation function is

$$h(\phi_p) = \phi_p^3 (10-15\phi_p + 6\phi_p^2)$$

which satisfies $h(0)=0$, $h(1)=1$ and $h'(0)=h'(1)=0$, so the bulk
phases are equilibrium states of the phase-field equation.

References
==========
