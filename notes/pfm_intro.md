---
documentclass: report
title: The Phase-Field Method
author: Chirantandip Mahanta
numbersections: true
---

The Fundamentals of Phase Field {#tfpf}
===========================


Introduction
----------------

The phase-field method is a thermodynamics-based approach used mostly to
model phase transformations and microstructure evolution in materials.
It is a mesoscale method: it works at length scales between the atomic
scale and a few micrometres, where individual atoms are not resolved but
the interfaces between grains or phases still matter.

The state of the system is described by one or more fields that vary
continuously in space and time. Such a field is called an order
parameter, and we will denote it by $\phi(\mathbf{r},t)$. It can be an
abstract indicator of phase (for example $\phi=0$ in the solid,
$\phi=1$ in the liquid, and $0<\phi<1$ inside the interface between
them), or a measurable quantity such as concentration. Its evolution is
determined by the free energy of the system, which decreases
monotonically as the system relaxes.

Order parameters come in two kinds. If the integral of $\phi$ over the
system must stay fixed, as concentration must because mass is conserved,
$\phi$ is a conserved order parameter. Quantities such as phase identity
or grain orientation obey no such law and are called non-conserved order
parameters. The two kinds evolve according to different equations: the
Allen-Cahn equation for non-conserved fields and the Cahn-Hilliard
equation for conserved ones.

## The Allen-Cahn Equation

### The Free Energy Functional

The free energy has to do two things: penalise the presence of an
interface, and favour one of two stable phases in the bulk. The usual
functional that does both is

$$F[\phi] = \int_V \left[ \underbrace{f(\phi)}_{\text{bulk}} + \underbrace{\frac{\epsilon^2}{2}|\nabla\phi|^2}_{\text{gradient}} \right] dV$$

The bulk term $f(\phi)$ has two minima, one for each phase. The standard
choice is the symmetric double-well

$$f(\phi) = W\phi^2(1-\phi)^2$$

where $W > 0$ sets the height of the barrier between the wells at
$\phi=0$ and $\phi=1$. The gradient term costs energy wherever $\phi$
varies in space. A very sharp interface has a large gradient and is
expensive; a very wide one has small gradients but puts a lot of
material at intermediate values of $\phi$, where $f$ is high. The
equilibrium interface is the compromise between the two, and we will
compute it below.

### The Variational Derivative

Perturbing $\phi \to \phi + \delta\phi$ changes $F$ by

$$\delta F = \int_V \left[ \frac{\partial f}{\partial \phi}\delta\phi + \epsilon^2 \nabla\phi \cdot \nabla(\delta\phi) \right] dV$$

Integrating the second term by parts, with $\delta\phi = 0$ (or
$\nabla\phi\cdot\mathbf{n}=0$) on the boundary,

$$\int_V \epsilon^2 \nabla\phi \cdot \nabla(\delta\phi)\,dV = -\int_V \epsilon^2 \nabla^2\phi\,\delta\phi\,dV$$

so that

$$\delta F = \int_V \left[ \frac{\partial f}{\partial \phi} - \epsilon^2 \nabla^2\phi \right] \delta\phi \,dV \equiv \int_V \frac{\delta F}{\delta \phi}\,\delta\phi\,dV$$

The bracket is the functional derivative $\delta F / \delta\phi$. It
plays the role of an ordinary derivative: it tells us how much $F$
changes when $\phi$ is changed locally at a point.

### The Gradient Flow

For a non-conserved field, the simplest dynamics that always lowers $F$
is to let $\phi$ change at each point in proportion to the local
driving force:

$$\frac{\partial \phi}{\partial t} = -L\,\frac{\delta F}{\delta \phi} = -L\left[\frac{\partial f}{\partial \phi} - \epsilon^2\nabla^2\phi\right]$$

This is the Allen-Cahn equation, and $L > 0$ is a kinetic coefficient.
That $F$ never increases follows directly:

$$\frac{dF}{dt} = \int_V \frac{\delta F}{\delta\phi}\frac{\partial\phi}{\partial t}\,dV = -L\int_V\left(\frac{\delta F}{\delta\phi}\right)^2 dV \leq 0$$

so $F$ is a Lyapunov function of the dynamics.

For the double-well,

$$\frac{\partial f}{\partial \phi} = 2W\phi(1-\phi)(1-2\phi)$$

and the Allen-Cahn equation becomes

$$\frac{\partial \phi}{\partial t} = -L\left[2W\phi(1-\phi)(1-2\phi) - \epsilon^2\nabla^2\phi\right]$$

The reaction term pushes $\phi$ towards whichever well is closer, 0 or
1. The Laplacian term smooths $\phi$ in space. Their balance gives an
interface of finite width.

### 1D Equilibrium Interface Profile

In 1D at equilibrium ($\partial\phi/\partial t = 0$):

$$\epsilon^2\frac{d^2\phi}{dx^2} = \frac{\partial f}{\partial \phi} = 2W\phi(1-\phi)(1-2\phi)$$

with $\phi(-\infty) = 0$ and $\phi(+\infty) = 1$. Multiplying both
sides by $d\phi/dx$, the left side becomes
$\frac{\epsilon^2}{2}\frac{d}{dx}\left(\frac{d\phi}{dx}\right)^2$ and
the right side $\frac{d}{dx}f(\phi)$. Integrating from $-\infty$ to $x$,
and using that both $d\phi/dx$ and $f$ vanish in the bulk,

$$\frac{\epsilon^2}{2}\left(\frac{d\phi}{dx}\right)^2 = f(\phi) = W\phi^2(1-\phi)^2$$

This is separable:

$$\frac{d\phi}{\phi(1-\phi)} = \frac{\sqrt{2W}}{\epsilon}\,dx
\quad\Rightarrow\quad
\ln\!\left(\frac{\phi}{1-\phi}\right) = \frac{\sqrt{2W}}{\epsilon}\,(x - x_0)$$

and solving for $\phi$,

$$\phi_{\rm eq}(x) = \frac{1}{2}\left[1 + \tanh\!\left(\frac{x - x_0}{\lambda}\right)\right], \qquad \lambda = \frac{2\epsilon}{\sqrt{2W}} = \epsilon\sqrt{\frac{2}{W}}$$

Here $x_0$ is the position of the interface (arbitrary, since the
problem is translation invariant) and $\lambda$ is a measure of the
interface width. Increasing $\epsilon$ or decreasing $W$ widens the
interface; the opposite sharpens it.

### Interface Energy

The interface energy per unit area $\gamma$ is the excess free energy
of the interface relative to the bulk phases:

$$\gamma = \int_{-\infty}^{+\infty} \left[ f(\phi_{\rm eq}) + \frac{\epsilon^2}{2}\left(\frac{d\phi_{\rm eq}}{dx}\right)^2 \right] dx$$

Since $\frac{\epsilon^2}{2}(d\phi/dx)^2 = f(\phi)$ at equilibrium, the
two contributions are equal, and changing the integration variable to
$\phi$ (using $d\phi/dx = \sqrt{2f}/\epsilon$),

$$\gamma = 2\int_{-\infty}^{+\infty} f(\phi_{\rm eq})\,dx = 2\int_0^1 f(\phi)\frac{dx}{d\phi}\,d\phi = \sqrt{2}\,\epsilon\int_0^1 \sqrt{f(\phi)}\,d\phi$$

For $f = W\phi^2(1-\phi)^2$:

$$\gamma = \epsilon\sqrt{2W}\int_0^1 \phi(1-\phi)\,d\phi = \frac{\epsilon\sqrt{2W}}{6}$$

So $\lambda \propto \epsilon/\sqrt{W}$ and $\gamma \propto
\epsilon\sqrt{W}$, and the two can be set independently through
$\epsilon$ and $W$. In practice $\gamma$ is a material property, while
$\lambda$ is chosen to be resolved by the numerical grid (usually much
wider than a real interface); $\epsilon$ and $W$ then follow.

### Interface Motion and the Sharp-Interface Limit

To see how the interface moves, add a small bulk driving force: let the
two wells differ in depth by $\Delta g$ per unit volume (favouring
$\phi=1$), and let the interface be curved with mean curvature $\kappa$
(sum of principal curvatures, positive when the $\phi=1$ region is
convex). When $\lambda$ is small compared with the radius of curvature,
$\phi$ across the interface stays close to the 1D tanh profile, and in a
coordinate $u$ normal to the interface the Laplacian is approximately
$\phi'' - \kappa\phi'$, with $u$ pointing into the $\phi=1$ region. Looking for a profile that
moves with normal velocity $v$ (positive when the $\phi=1$ phase grows), multiplying the equation by $\phi'$ and
integrating across the interface gives

$$v = \frac{L\epsilon^2}{\gamma}\left(\Delta g - \gamma\kappa\right)$$

where we have used $\int (\phi')^2\,du = \gamma/\epsilon^2$. This is the
classical sharp-interface law: velocity equals an interface mobility
$m = L\epsilon^2/\gamma$ times the driving force, which is the bulk
energy difference reduced by the capillary (Gibbs-Thomson) term
$\gamma\kappa$. With no bulk driving force, $v = -L\epsilon^2\kappa$:
Allen-Cahn reduces to motion by mean curvature, and convex regions of
the $\phi=1$ phase shrink. The interface is never tracked explicitly;
its motion comes out of the evolution of the field.


## The Cahn-Hilliard Equation

Concentration is conserved: solute atoms cannot appear or disappear,
they can only move. This changes the form of the dynamics. In
Allen-Cahn, $\phi$ changes at a point in response to the local driving
force. For a conserved field, the value at a point can only change by
material flowing in or out, so the evolution must take the form of a
continuity equation:

$$\frac{\partial c}{\partial t} = -\nabla \cdot \mathbf{J}$$

Atoms flow down gradients of chemical potential, which here is the
functional derivative of the free energy:

$$\mu = \frac{\delta F}{\delta c} = \frac{\partial f}{\partial c} - \epsilon^2\nabla^2 c, \qquad \mathbf{J} = -M\nabla\mu$$

where $M > 0$ is the atomic mobility. Combining the two (with constant
$M$),

$$\frac{\partial c}{\partial t} = \nabla \cdot (M\nabla\mu) = M\nabla^2\left[\frac{\partial f}{\partial c} - \epsilon^2\nabla^2 c\right]$$

This is the Cahn-Hilliard equation. The functional $F$ is the same as
before, with $c$ (say, the mole fraction of one component) in place of
$\phi$. A double-well $f(c)$ now describes a miscibility gap: two
compositions are stable and mixtures in between can lower their energy
by separating.

With $f = Wc^2(1-c)^2$:

$$\frac{\partial c}{\partial t} = M\nabla^2\!\left[2Wc(1-c)(1-2c) - \epsilon^2\nabla^2 c\right]$$

Where $f''(c) < 0$ (inside the spinodal), the first term gives a
negative effective diffusivity: solute flows up its concentration
gradient and small fluctuations grow, the opposite of ordinary Fickian
diffusion. The fourth-order gradient term penalises rapid variations in
$c$ and damps short-wavelength fluctuations. The competition between the
two selects a characteristic length scale, as the linear stability
analysis shows.

### Linear Stability Analysis

Take a uniform state $c = c_0$ with a small perturbation

$$c(x,t) = c_0 + A(t)\cos(kx)$$

Expanding $\partial f/\partial c$ about $c_0$ and keeping terms linear in
$A$:

$$\dot{A} = -Mk^2\left[f''(c_0) + \epsilon^2 k^2\right] A$$

with $f''(c_0) = 2W(1 - 6c_0 + 6c_0^2)$. So $A(t) = A_0 e^{\sigma(k)t}$
with growth rate

$$\sigma(k) = -Mk^2\left[f''(c_0) + \epsilon^2 k^2\right]$$

A mode grows when $\sigma > 0$, i.e. when

$$f''(c_0) + \epsilon^2 k^2 < 0 \implies k^2 < k_c^2 \equiv \frac{-f''(c_0)}{\epsilon^2}$$

This requires $f''(c_0) < 0$, which defines the spinodal region. For the
symmetric double-well it is $c_0 \in (c_-, c_+)$ with $c_\pm = \frac{1}{2}
\pm \frac{1}{2\sqrt{3}}$. Outside it $f''(c_0) > 0$, every mode decays,
and the uniform state is stable against small fluctuations (though
between the spinodal and the miscibility gap it is still metastable and
can decompose by nucleation).

Maximising $\sigma$ with respect to $k^2$:

$$\frac{d\sigma}{d(k^2)} = 0 \implies k_{\rm max}^2 = \frac{-f''(c_0)}{2\epsilon^2} = \frac{k_c^2}{2}$$

The wavelength $\lambda_{\rm max} = 2\pi/k_{\rm max}$ sets the initial
spacing of the composition domains in spinodal decomposition. A larger
$\epsilon$ shifts it to longer wavelengths and gives a coarser initial
microstructure.

### 1D Equilibrium Concentration Profile

At long times the system separates into solute-rich and solute-poor
regions. At equilibrium $\mu = \delta F/\delta c$ is uniform. For the
symmetric double-well with average composition inside the miscibility
gap, the constant is $\mu = 0$, the bulk phases are $c=0$ and $c=1$,
and the equation for the profile is exactly the one solved for
Allen-Cahn. Hence

$$c_{\rm eq}(x) = \frac{1}{2}\left[1 + \tanh\!\left(\frac{x - x_0}{\lambda}\right)\right], \qquad \lambda = \epsilon\sqrt{\frac{2}{W}}$$

The two equations share the same free energy, so they share the same
equilibrium states (for a non-symmetric $f$ one needs $\mu = $ const
rather than $0$, and the common tangent construction fixes the bulk
compositions). What differs is how equilibrium is approached. In
Allen-Cahn, $\int\phi\,dV$ can change freely. In Cahn-Hilliard,
$\int c\,dV$ is fixed, so building up domains requires long-range
diffusion, which is slower. This shows up in the coarsening laws: the
average domain size grows as $R \sim t^{1/2}$ for non-conserved
(curvature-driven) dynamics and as $R \sim t^{1/3}$ for conserved
dynamics.

### Coarsening

After spinodal decomposition, the microstructure continues to coarsen:
large domains grow at the expense of small ones. Because of the
Gibbs-Thomson effect, the chemical potential near a curved interface is
raised by an amount proportional to $\gamma/R$, so solute diffuses from
small particles to large ones (Ostwald ripening). The flux is set by the
chemical potential difference over a diffusion distance of order $R$,
so

$$\frac{dR}{dt} \propto \frac{M\gamma}{R^2} \implies R(t)^3 \propto M\gamma t$$

This $t^{1/3}$ law is the Lifshitz-Slyozov-Wagner (LSW) result. It
follows from conservation and diffusion-limited transport rather than
from the details of $f$, and is observed in alloys, polymer blends and
liquid mixtures.


Kobayashi Dendrite Growth
-------------------------

Dendrites form during solidification of an undercooled melt because the
solid-liquid interface energy (and the interface kinetics) depend on
crystallographic direction. A growing front is unstable to small
perturbations, and anisotropy picks out the directions in which the
perturbations grow into primary arms and side branches. Kobayashi
[@Kobayashi1993] wrote one of the first phase-field models to reproduce
this, with a simple set of equations.

The model has two fields: the phase field $\phi(\mathbf{r},t)$, equal to
1 in the solid and 0 in the liquid, and the temperature
$T(\mathbf{r},t)$. Solidification releases latent heat at the
interface, which must diffuse away into the undercooled liquid before
the front can advance further. The temperature equation is

$$\frac{\partial T}{\partial t} = \nabla^2T + K\frac{\partial \phi}{\partial t}$$

where the last term is the latent heat released wherever $\phi$
increases, and $K$ is the dimensionless latent heat. Temperature is
scaled so that the melting temperature is $T_{eq}=1$ and the initial
undercooled liquid is at $T=0$.

The free energy functional is

$$F(\phi,m) = \int_V \left[\frac{1}{2} \epsilon^2 |\nabla \phi|^2 + f(\phi,m)\right]dV$$

with the double-well

$$f(\phi,m) = \frac{1}{4}\phi^4 - \left(\frac{1}{2} - \frac{m}{3}\right)\phi^3 + \left(\frac{1}{4} - \frac{m}{2}\right)\phi^2$$

which has minima at $\phi=0$ and $\phi=1$ for $|m|<1/2$, with
$f(0)=0$ and $f(1) = -m/6$. The parameter $m$ tilts the wells and is
tied to the temperature through

$$m(T) = \frac{\alpha}{\pi} \arctan{[ \gamma (T_{eq}-T)]}$$

with $\alpha < 1$ so that $|m| < 1/2$ (here $\gamma$ is just a model
constant, not the interface energy). Below the melting point $m > 0$,
the solid well is lower, and the solid grows; above it the solid melts.

The gradient flow of $F$, $\tau\,\partial\phi/\partial t = -\delta
F/\delta\phi$, gives for constant $\epsilon$

$$\tau\frac{\partial \phi}{\partial t} = \epsilon^2\nabla^2\phi + \phi(1-\phi)\left(\phi - \frac{1}{2} + m\right)$$

The Laplacian term smooths $\phi$ across the interface. The last term,
which is $-\partial f/\partial\phi$, vanishes in the bulk phases and
acts only within the interface, pushing $\phi$ towards the lower well.

**Anisotropy.** To make the interface energy depend on orientation,
Kobayashi lets $\epsilon$ depend on the angle $\theta$ of the interface
normal:

$$\epsilon = \bar{\epsilon}\,\sigma(\theta), \qquad \sigma(\theta) = 1 + \delta \cos{j(\theta - \theta_0)}, \qquad \theta = \arctan\!\left(\frac{\partial \phi / \partial y}{\partial \phi / \partial x}\right)$$

where $\delta$ is the strength of anisotropy, $j$ the mode number (4
for cubic symmetry, 6 for hexagonal) and $\theta_0$ the orientation of
the crystal. Because $\epsilon$ now depends on $\nabla\phi$ through
$\theta$, the variational derivative of the gradient term picks up extra
terms. Using $\partial\theta/\partial\phi_x = -\phi_y/|\nabla\phi|^2$
and $\partial\theta/\partial\phi_y = \phi_x/|\nabla\phi|^2$, one gets

$$\tau\frac{\partial \phi}{\partial t} = -\frac{\partial}{\partial x}\!\left(\epsilon \frac{\partial\epsilon}{\partial\theta} \frac{\partial\phi}{\partial y}\right) + \frac{\partial}{\partial y}\!\left(\epsilon \frac{\partial\epsilon}{\partial\theta} \frac{\partial\phi}{\partial x}\right) + \nabla \cdot (\epsilon^2\nabla\phi) + \phi(1-\phi)\!\left(\phi -\tfrac{1}{2} +m\right)$$

The first two terms vanish when $\delta = 0$, recovering the isotropic
equation. With $\delta > 0$ the interface advances fastest along the
$j$ directions $\theta = \theta_0 + 2\pi n/j$, and the coupling with
the temperature field turns these into dendrite arms with side branches.
We will refer to this model as KOB.


References
==========
