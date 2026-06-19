## Classical Laws & Thermodynamic Potentials


### The Four Laws 

**Zeroth Law.** If system A is in thermal equilibrium with system B, and B is in thermal equilibrium with system C, then A is in thermal equilibrium with C. This transitivity property is what makes *temperature* a well-defined, measurable scalar property: temperature is the equivalence class of "systems in mutual thermal equilibrium." 

**First Law (closed system).** The internal energy $U$ is a state function, and for any process:
$$\Delta U = Q - W_{\text{by system}} = Q + W_{\text{on system}},$$
where $Q$ is heat absorbed by the system and $W$ is work done. For an infinitesimal reversible process on a multicomponent open system:
$$dU = \delta Q_{\text{rev}} - \delta W_{\text{rev}} = T\,dS - P\,dV + \sum_{i=1}^{c}\mu_i\,dN_i,$$
which is the **fundamental relation**. Here $S$ is entropy, $T$ temperature, $P$ pressure, $V$ volume, $\mu_i$ the chemical potential of species $i$, and $N_i$ the number of moles of species $i$.

**Second Law.** For any process in an isolated system, $dS \geq 0$, with equality if and only if the process is reversible (quasi-static and without dissipation). Equivalently:

| Fixed variables | Equilibrium condition |
|---|---|
| $S, V, N_i$ (isolated) | Minimize $U$ |
| $T, V, N_i$ | Minimize $F = U - TS$ |
| $T, P, N_i$ | Minimize $G = U + PV - TS$ |
| $S, P, N_i$ | Minimize $H = U + PV$ |

**Third Law (Nernst–Planck statement).** For a perfect crystalline substance with a unique ground state:
$$\lim_{T\to 0} S(T) = 0.$$
More precisely, the entropy change in any process approaches zero as $T\to0$. This gives the absolute entropy scale used by CALPHAD thermodynamic databases. Exceptions occur in systems with residual entropy (e.g., glasses or disordered crystals with degenerate ground states), where $S(0) > 0$.


### The Fundamental Relation and Its Differential Form

For a reversible infinitesimal process on a closed single-component system, the second law gives $\delta Q_{\text{rev}} = T\,dS$ and the first law gives $dU = \delta Q - \delta W_{\text{by}} = T\,dS - P\,dV$ (using $\delta W_{\text{by}} = P\,dV$ for reversible $P$–$V$ work). For an open multicomponent system, work can also be done by adding or removing matter; the contribution to $dU$ of adding $dN_i$ moles of species $i$ reversibly at fixed $S, V, N_{j\neq i}$ is by definition:
$$\mu_i \equiv \left(\frac{\partial U}{\partial N_i}\right)_{S,V,N_{j\neq i}}.$$
Collecting all contributions:
$$\boxed{dU = T\,dS - P\,dV + \sum_i \mu_i\,dN_i.}$$

**Completeness check.** The natural variables of $U$ are $(S, V, N_i)$; the fundamental relation expresses $U$ as a function of these variables alone, and all remaining thermodynamic properties follow by differentiation. This is what makes $dU = T\,dS - P\,dV + \sum_i\mu_i\,dN_i$ a *complete* thermodynamic description.


### Legendre Transforms and the Four Thermodynamic Potentials

The fundamental relation $U(S,V,N_i)$ is most useful when $S,V,N_i$ are the natural controlled variables. In most materials-processing settings, the experimentally controlled variables are $T$ (thermostat), $P$ (isobaric container), and $N_i$ (fixed amounts). The **Legendre transform** replaces an extensive natural variable by its conjugate intensive variable without losing any thermodynamic information.

#### Enthalpy $H$ : $V \to P$.

Define $H \equiv U + PV$. Then:
$$dH = dU + P\,dV + V\,dP.$$
Substituting $dU = T\,dS - P\,dV + \sum_i\mu_i\,dN_i$:
$$dH = T\,dS - P\,dV + \sum_i\mu_i\,dN_i + P\,dV + V\,dP = T\,dS + V\,dP + \sum_i\mu_i\,dN_i.$$
$$\boxed{H(S,P,N_i):\quad dH = T\,dS + V\,dP + \sum_i\mu_i\,dN_i.}$$

Natural variables: $(S, P, N_i)$. $H$ is minimized at equilibrium at constant $S, P$.

####  Helmholtz energy $F$  : $S \to T$.

Define $F \equiv U - TS$. Then $dF = dU - T\,dS - S\,dT$. Substituting $dU$:
$$dF = T\,dS - P\,dV + \sum_i\mu_i\,dN_i - T\,dS - S\,dT = -S\,dT - P\,dV + \sum_i\mu_i\,dN_i.$$
$$\boxed{F(T,V,N_i):\quad dF = -S\,dT - P\,dV + \sum_i\mu_i\,dN_i.}$$

Natural variables: $(T, V, N_i)$. $F$ is minimized at equilibrium at constant $T, V$.

#### Gibbs energy $G$ : $S \to T$ and $V \to P$.

Define $G \equiv U + PV - TS = H - TS = F + PV$. Then:
$$dG = dF + P\,dV + V\,dP = -S\,dT - P\,dV + \sum_i\mu_i\,dN_i + P\,dV + V\,dP.$$
$$\boxed{G(T,P,N_i):\quad dG = -S\,dT + V\,dP + \sum_i\mu_i\,dN_i.}$$

Natural variables: $(T, P, N_i)$. $G$ is minimized at equilibrium at constant $T, P$ — the reason materials science focuses almost exclusively on $G$.

**Complete summary of the four potentials:**

| Potential | Definition | Differential | Natural variables | Equilibrium condition |
|---|---|---|---|---|
| $U$ (internal energy) | — | $T\,dS - P\,dV + \sum\mu_i\,dN_i$ | $S, V, N_i$ | Minimize $U$ at fixed $S,V,N$ |
| $H$ (enthalpy) | $U+PV$ | $T\,dS + V\,dP + \sum\mu_i\,dN_i$ | $S, P, N_i$ | Minimize $H$ at fixed $S,P,N$ |
| $F$ (Helmholtz) | $U-TS$ | $-S\,dT - P\,dV + \sum\mu_i\,dN_i$ | $T, V, N_i$ | Minimize $F$ at fixed $T,V,N$ |
| $G$ (Gibbs) | $H-TS$ | $-S\,dT + V\,dP + \sum\mu_i\,dN_i$ | $T, P, N_i$ | Minimize $G$ at fixed $T,P,N$ |


### The Chemical Potential

From $dG = -S\,dT + V\,dP + \sum_i\mu_i\,dN_i$, at constant $T$ and $P$:
$$\mu_i = \left(\frac{\partial G}{\partial N_i}\right)_{T,P,N_{j\neq i}}.$$
$\mu_i$ is therefore the *partial molar Gibbs energy* — the change in total Gibbs energy upon adding one mole of species $i$ reversibly to a large reservoir at fixed $T$, $P$, and composition. 

Alternative expressions (all equivalent; valid identifications from the respective natural variables):
$$\mu_i = \left(\frac{\partial U}{\partial N_i}\right)_{S,V,N_{j\neq i}} = \left(\frac{\partial H}{\partial N_i}\right)_{S,P,N_{j\neq i}} = \left(\frac{\partial F}{\partial N_i}\right)_{T,V,N_{j\neq i}} = \left(\frac{\partial G}{\partial N_i}\right)_{T,P,N_{j\neq i}}.$$

$\mu_i$ measures the "escaping tendency" of species $i$: species flow from regions of high $\mu_i$ to low $\mu_i$, exactly as heat flows from high $T$ to low $T$ and mechanical equilibrium requires equal $P$. At equilibrium across all phases $\alpha,\beta,\dots$: $\mu_i^\alpha = \mu_i^\beta = \cdots$ for all $i$. 

For a pure substance at $T, P$:
$$\mu_i^\circ(T,P) = G_i^\circ(T,P),$$
the molar Gibbs energy of the pure component. Deviations from ideality are absorbed into the **activity** $a_i$ (Module T5):
$$\mu_i(T,P,\{x_j\}) = \mu_i^\circ(T,P) + RT\ln a_i.$$


### Maxwell Relations

Because $G, H, F, U$ are state functions, their mixed second partial derivatives are equal (Schwarz's theorem, assuming sufficient smoothness). Applied to the four differentials:

From $dU = T\,dS - P\,dV$:
$$\left(\frac{\partial T}{\partial V}\right)_S = -\left(\frac{\partial P}{\partial S}\right)_V.$$

From $dH = T\,dS + V\,dP$:
$$\left(\frac{\partial T}{\partial P}\right)_S = \left(\frac{\partial V}{\partial S}\right)_P.$$

From $dF = -S\,dT - P\,dV$:
$$\left(\frac{\partial S}{\partial V}\right)_T = \left(\frac{\partial P}{\partial T}\right)_V.$$

From $dG = -S\,dT + V\,dP$:
$$\boxed{\left(\frac{\partial S}{\partial P}\right)_T = -\left(\frac{\partial V}{\partial T}\right)_P.}$$

The last of these (from $G$) is the most used in materials science: the left side is hard to measure directly; the right side is $-V\alpha$, where $\alpha = \frac{1}{V}\left(\frac{\partial V}{\partial T}\right)_P$ is the isobaric thermal expansion coefficient, easily measured by dilatometry.

**Additional Maxwell relation from $G$ for multicomponent systems:**
$$\left(\frac{\partial \mu_i}{\partial P}\right)_{T,N} = \left(\frac{\partial V}{\partial N_i}\right)_{T,P,N_{j\neq i}} = \bar{V}_i$$
where $\bar{V}_i$ is the partial molar volume of species $i$. 

$$\left(\frac{\partial \mu_i}{\partial T}\right)_{P,N} = -\left(\frac{\partial S}{\partial N_i}\right)_{T,P,N_{j\neq i}} = -\bar{S}_i$$
where $\bar{S}_i$ is the partial molar entropy. 


### Heat Capacities and Their Relations

$$C_P \equiv \left(\frac{\partial H}{\partial T}\right)_{P,N} = T\left(\frac{\partial S}{\partial T}\right)_{P,N}, \qquad C_V \equiv \left(\frac{\partial U}{\partial T}\right)_{V,N} = T\left(\frac{\partial S}{\partial T}\right)_{V,N}.$$

Both equalities between the heat-capacity and entropy-derivative expressions follow directly from the respective fundamental differentials (e.g., $dH = T\,dS + V\,dP$; at constant $P$: $(\partial H/\partial T)_P = T(\partial S/\partial T)_P$).

**Relation $C_P - C_V = TV\alpha^2/\kappa_T$.**

Define:
$$\alpha \equiv \frac{1}{V}\left(\frac{\partial V}{\partial T}\right)_P \quad (\text{isobaric thermal expansion coefficient})$$
$$\kappa_T \equiv -\frac{1}{V}\left(\frac{\partial V}{\partial P}\right)_T \quad (\text{isothermal compressibility}).$$

Step 1. Use the cyclic triple-product identity (also called the "triple-product rule"):
$$\left(\frac{\partial P}{\partial T}\right)_V \left(\frac{\partial T}{\partial V}\right)_P \left(\frac{\partial V}{\partial P}\right)_T = -1,$$
which gives $\left(\frac{\partial P}{\partial T}\right)_V = -\dfrac{(\partial V/\partial T)_P}{(\partial V/\partial P)_T} = \dfrac{V\alpha}{V\kappa_T} = \dfrac{\alpha}{\kappa_T}$.

Step 2. Express $C_P - C_V$ using a standard thermodynamic identity derived by writing $S = S(T,V)$ and $S = S(T,P)$ and using the chain rule:
$$C_P - C_V = -T\frac{\left[(\partial P/\partial T)_V\right]^2}{(\partial P/\partial V)_T}.$$

Step 3. Note $(\partial P/\partial V)_T = 1/(\partial V/\partial P)_T = -1/(V\kappa_T)$.

Step 4. Substituting:
$$C_P - C_V = -T\cdot\frac{(\alpha/\kappa_T)^2}{-1/(V\kappa_T)} = \frac{TV\alpha^2/\kappa_T^2}{\kappa_T^{-1}} = \frac{TV\alpha^2}{\kappa_T}.$$

$$\boxed{C_P - C_V = \frac{TV\alpha^2}{\kappa_T}.}$$

* Since $V, T, \alpha^2 \geq 0$ and $\kappa_T > 0$ for any mechanically stable material, $C_P \geq C_V$ always, with equality only at $T=0$ (where $\alpha\to0$ by the third law). The difference can be large near phase transitions where $\alpha$ spikes. For liquids and solids under ambient pressure, $C_P - C_V$ is typically a few percent of $C_V$.

**Heat capacities from $G(T,P)$.**

Since $S = -(\partial G/\partial T)_P$:
$$C_P = -T\left(\frac{\partial^2 G}{\partial T^2}\right)_P.$$
This is the form used directly in CALPHAD databases, where $G(T,P)$ is expressed as a polynomial in $T$ (typically $a + bT + cT\ln T + dT^2 + eT^{-1} + \cdots$ following the Dinsdale/SGTE format) and $C_P$ is obtained by twice differentiating. 


### Stability Conditions 

A useful way to understand thermodynamic stability is to consider splitting a homogeneous phase into two equal subsystems and introducing a small fluctuation in an intensive variable. If the total free energy decreases after the fluctuation, the homogeneous state is unstable. Therefore, stability requires that infinitesimal fluctuations increase the appropriate thermodynamic potential.

#### Entropy Representation: $S(U,V,N)$

For an isolated system, equilibrium corresponds to maximum entropy. Thus, $S(U,V,N)$ must be a **concave** function of its extensive variables ($U$, $V$, $N$). This implies $\delta^2 S < 0$ and a negative-definite Hessian.

Important consequences are:
$$
\left(\frac{\partial^2 S}{\partial U^2}\right)_{V,N} < 0, \qquad
\left(\frac{\partial^2 S}{\partial V^2}\right)_{U,N} < 0.
$$
These conditions lead to positive heat capacities and compressibilities.

#### Internal Energy Representation: $U(S,V,N)$

Since $U$ is the Legendre transform of $S$, its curvature is reversed. Stability requires $U(S,V,N)$ to be **convex**, so $\delta^2 U > 0$.

Thermal stability demands:
$$
\left(\frac{\partial^2 U}{\partial S^2}\right)_{V,N} = \left(\frac{\partial T}{\partial S}\right)_{V,N} = \frac{T}{C_V} > 0,
$$
which implies $C_V > 0$.

Mechanical stability requires:
$$
\left(\frac{\partial^2 U}{\partial V^2}\right)_{S,N} = -\left(\frac{\partial P}{\partial V}\right)_S > 0,
$$
which is equivalent to a positive adiabatic compressibility ($\kappa_S > 0$).

#### Gibbs Free Energy Representation: $G(T,P,N)$

The Gibbs free energy has natural variables $T$, $P$, and $N$, with the differential
$$
dG = -S\,dT + V\,dP + \mu\,dN.
$$

From $\left(\frac{\partial G}{\partial T}\right)_P = -S$, it follows that
$$
\left(\frac{\partial^2 G}{\partial T^2}\right)_P = -\frac{C_P}{T} < 0.
$$
Thus, $G$ is concave in temperature.

Similarly, from $\left(\frac{\partial G}{\partial P}\right)_T = V$,
$$
\left(\frac{\partial^2 G}{\partial P^2}\right)_T = -V\kappa_T < 0,
$$
so $G$ is concave in pressure (provided $\kappa_T > 0$).

#### Composition Stability and the Spinodal

Thermal and mechanical stability conditions are distinct from stability against composition fluctuations.

For a binary system described by $G(T,P,x)$, stability against composition fluctuations requires positive curvature:
$$
\left(\frac{\partial^2 G}{\partial x^2}\right)_{T,P} > 0.
$$

If $\left(\frac{\partial^2 G}{\partial x^2}\right)_{T,P} < 0$, the homogeneous phase is unstable to infinitesimal composition fluctuations. This defines the **spinodal** region, where phase separation occurs spontaneously without a nucleation barrier.

The spinodal boundary is given by
$$
\left(\frac{\partial^2 G}{\partial x^2}\right)_{T,P} = 0.
$$

#### Key Stability Conditions

- $S(U,V,N)$ is concave.
- $U(S,V,N)$ is convex.
- $C_V > 0$ and $C_P > 0$.
- $\kappa_S > 0$ and $\kappa_T > 0$.
- Stable mixtures require $\left(\frac{\partial^2 G}{\partial x^2}\right)_{T,P} > 0$.
- Spinodal decomposition occurs when $\left(\frac{\partial^2 G}{\partial x^2}\right)_{T,P} < 0$.


### The Clausius–Clapeyron Equation

At a two-phase equilibrium boundary (e.g., liquid–solid) at temperature $T$ and pressure $P$, the chemical potentials of all species are equal in both phases. For a single-component system: $G^\alpha(T,P) = G^\beta(T,P)$. Moving along the coexistence curve by $dT$ and $dP$:
$$dG^\alpha = -S^\alpha\,dT + V^\alpha\,dP = dG^\beta = -S^\beta\,dT + V^\beta\,dP.$$
Rearranging:
$$(S^\alpha - S^\beta)\,dT = (V^\alpha - V^\beta)\,dP,$$
$$\frac{dP}{dT} = \frac{\Delta S}{\Delta V} = \frac{L}{T\,\Delta V},$$

where $L = T\Delta S = T(S^\alpha - S^\beta)$ is the latent heat per mole. Giving:

$$\boxed{\frac{dP}{dT} = \frac{L}{T\,\Delta V}.}$$

**Consequence for solidification.** Since $\Delta V_{\text{fusion}} = V_L - V_S$ is small and often positive for metals (though negative for water), $dP/dT$ is large. Melting points of metals increase with pressure at roughly $10$–$30\,$K/GPa. This becomes relevant in high-pressure casting and shock-loading experiments.


### Notes
- Classical thermodynamics strictly describes processes that occur infinitely slowly through a series of equilibrium states, Quasi-static (reversible) processes. Real processes are irreversible and happen at finite speeds. State functions ($U$, $G$, $S$, etc.) are still useful because they are path-independent, but work and heat are path-dependent.
- The local equilibrium assumption (LEA).  When applying thermodynamics locally in non-uniform, evolving systems (e.g., diffusion, phase-field, or solidification), we assume each small volume element is in internal equilibrium. The LEA works well for diffusion in metals but breaks down at high growth speeds, near spinodals, or close to critical points.
- Simple systems.  Classical thermodynamics applies to simple, uniform systems without external fields or significant surface effects. These assumptions often fail in solidification (non-uniform temperatures, curved interfaces, electromagnetic fields), so extensions like the Gibbs–Thomson relation are needed.
- Thermodynamics is derived for systems with $N \to \infty$ particles. For very small clusters (e.g., critical nuclei in nucleation), fluctuations are large and average properties may not hold accurately. This limits classical nucleation theory.
-  Many approximations (e.g., $\Delta G_v \approx L \Delta T / T_m$) assume latent heat $L$ and entropy difference $\Delta S$ are constant with temperature. In reality, they vary because $C_P$ differs between phases:  $L(T) = L(T_m) + \int_{T_m}^T \Delta C_P \, dT'$.  The correction is small for most metals but important for polymers and oxides.
- $\Delta G < 0$ only means the process is thermodynamically favorable at constant $T$ and $P$. It does **not** guarantee it will happen. A large kinetic barrier can prevent the change (example: diamond does not turn into graphite at room temperature).
- Calling entropy "disorder" is misleading and imprecise. Entropy actually measures the number of accessible microstates ($S = k_B \ln \Omega$) or the spreading of energy and atoms over possible arrangements. Configurational entropy is especially important in materials.
- "The Gibbs energy is the energy available to do useful work."  This is imprecise. At constant $T$ and $P$, the maximum non-$PV$ work you can get is $-\Delta G$, not $G$ itself. $G$ is only meaningful as a difference between states.
- "Enthalpy change is the heat of reaction at constant pressure only." True only when the system does **only** $PV$ work. If there is electrical, magnetic, or other work, $Q_P \neq \Delta H$.
- "The Helmholtz energy $F$ and Gibbs energy $G$ can be used interchangeably." No. $F$ is minimized at constant $T,V$ while $G$ is minimized at constant $T,P$. Their natural variables and Maxwell relations are different.
- "Latent heat is the energy stored in the solid." Incorrect. Latent heat ($L$) is the enthalpy difference between liquid and solid at the melting temperature: $L = H_L(T_m) - H_S(T_m)$. It is released to the surroundings during freezing and absorbed during melting — it is not "stored" in the solid.
- "Thermal equilibrium means the temperature everywhere is the same." Not quite. Thermal equilibrium requires uniform temperature **and** zero heat fluxes. In solidification, we often have temperature gradients and use the Local Equilibrium Approximation to apply thermodynamics locally.

## Gibbs–Duhem Relation & Partial Molar Quantities

### Euler's Theorem and the Euler Relation

**Euler's theorem for homogeneous functions of degree $k$.** If $f(\lambda x_1, \lambda x_2, \dots) = \lambda^k f(x_1, x_2, \dots)$ for all $\lambda > 0$, then:
$$\sum_i x_i \frac{\partial f}{\partial x_i} = k\,f.$$

**Extensivity of thermodynamic potentials.** Internal energy $U(S,V,N_1,\dots,N_c)$ is a *homogeneous function of degree 1* in all its natural variables. This means: doubling the size of a system at fixed intensive state doubles $U$, $S$, $V$, and all $N_i$ simultaneously. 

**The Euler relation.**

Set $k = 1$ in Euler's theorem applied to $U(S,V,N_i)$:
$$S\frac{\partial U}{\partial S} + V\frac{\partial U}{\partial V} + \sum_i N_i\frac{\partial U}{\partial N_i} = U.$$

Substituting $\partial U/\partial S = T$, $\partial U/\partial V = -P$, and $\partial U/\partial N_i = \mu_i$ from the fundamental relation:

$$\boxed{U = TS - PV + \sum_i \mu_i N_i.}$$

This is the **Euler relation** or **integrated form** of the fundamental relation. It tells you that $U$ is completely determined by $T, S, P, V, \mu_i, N_i$ — no independent information is added by integrating rather than differentiating.

**Analogous Euler relations for other potentials** (obtained by adding or subtracting $PV$ and $TS$ terms):
$$H = TS + \sum_i \mu_i N_i, \quad F = -PV + \sum_i \mu_i N_i, \quad G = \sum_i \mu_i N_i.$$

The last, $G = \sum_i \mu_i N_i$, confirms that the chemical potential is the partial molar Gibbs energy: $\mu_i = G/N_i$ for a pure component, and $\mu_i = \bar{G}_i$ (partial molar Gibbs energy) in a mixture. 


### Derivation of the Gibbs–Duhem Relation

Differentiate the Euler relation $U = TS - PV + \sum_i \mu_i N_i$ totally:
$$dU = T\,dS + S\,dT - P\,dV - V\,dP + \sum_i(\mu_i\,dN_i + N_i\,d\mu_i). \quad (*)$$

The fundamental relation gives:
$$dU = T\,dS - P\,dV + \sum_i\mu_i\,dN_i. \quad (**)$$

Subtracting $(**)$ from $(*)$:
$$0 = S\,dT - V\,dP + \sum_i N_i\,d\mu_i.$$

$$\boxed{S\,dT - V\,dP + \sum_i N_i\,d\mu_i = 0.}$$

Dividing through by total moles $N = \sum_i N_i$ and introducing mole fractions $x_i = N_i/N$, molar entropy $s = S/N$, molar volume $v = V/N$:
$$s\,dT - v\,dP + \sum_i x_i\,d\mu_i = 0.$$

**At constant temperature and pressure** (the case relevant to most phase-equilibrium calculations):
$$\boxed{\sum_i x_i\,d\mu_i = 0_{T,P}}.$$

For a **binary system** at constant $T,P$:
$$x_A\,d\mu_A + x_B\,d\mu_B = 0 \implies d\mu_B = -\frac{x_A}{x_B}\,d\mu_A.$$

This is the key constraint: in a binary solution at fixed $T$ and $P$, *only one* chemical potential is independently variable; the second is completely determined by the first through the Gibbs–Duhem relation.


### Partial Molar Quantities

For any extensive property $X$ (energy, volume, entropy, enthalpy, Gibbs energy) of a mixture, the **partial molar quantity** $\bar{X}_i$ is:
$$\bar{X}_i \equiv \left(\frac{\partial X}{\partial N_i}\right)_{T,P,N_{j\neq i}}.$$

**Relation between integral and partial molar quantities.** Applying Euler's theorem to $X(T,P,N_i)$ (extensive at fixed $T,P$):
$$X = \sum_i N_i\bar{X}_i, \quad \text{or per mole:} \quad x_m = \sum_i x_i\bar{X}_i,$$
where $x_m$ is the molar $X$ and $x_i$ mole fractions. 

**Molar mixing quantity.** Define $X^{\text{mix}} = X_{\text{solution}} - \sum_i x_i X_i^\circ$ where $X_i^\circ$ is the molar quantity of pure $i$. Then:
$$\Delta X_i^{\text{mix}} = \bar{X}_i - X_i^\circ$$
is the partial molar mixing quantity.


### Notes

-  Extensivity is an idealization. The Gibbs–Duhem relation comes from the extensivity of $U$. It holds exactly only for large, bulk systems where surface effects are negligible. For small systems like droplets or nuclei, surface energy ($\sim r^2$) becomes important compared to volume energy ($\sim r^3$). This requires corrections such as the Laplace pressure.
- The simple binary form $x_A \, d\mu_A + x_B \, d\mu_B = 0$ is valid only when temperature and pressure are held constant. If $T$ or $P$ changes along the path, the full Gibbs–Duhem relation must be used.
- Gibbs–Duhem does not say the chemical potentials are equal in a binary system. It only says the chemical potentials are *dependent* on each other. If you know how $\mu_A$ changes with composition, $\mu_B$ is fixed. Equal chemical potentials ($\mu_i^\alpha = \mu_i^\beta$) is the actual equilibrium condition between phases.
- The partial molar volume $\bar{V}_i$ can be negative if adding component $i$ causes the total volume to contract (e.g., strong attractions in mixtures like $\text{H}_2\text{SO}_4$ and water). There is no thermodynamic rule requiring it to be positive.


## Statistical Thermodynamics


### Boltzmann's Relation and the Statistical Definition of Entropy

**Boltzmann's entropy $S = k_B\ln\Omega$.**

Consider an isolated system with fixed $U,V,N$ having $\Omega(U,V,N)$ accessible microstates (each microstate is a complete specification of the positions and momenta of all atoms compatible with the macroscopic constraints). The **postulate of equal a priori probabilities** states that at equilibrium, all accessible microstates are equally probable with probability $1/\Omega$. The Boltzmann entropy is:
$$\boxed{S = k_B\ln\Omega,}$$
where $k_B = 1.380649\times10^{-23}\,\text{J}\,\text{K}^{-1}$ is Boltzmann's constant. 

**Connection to thermodynamic entropy.** The identification of this statistical $S$ with the thermodynamic entropy defined by $dS = \delta Q_{\text{rev}}/T$ is a non-trivial consistency requirement verified by showing that the statistical $S$ has all the properties of thermodynamic entropy: it is extensive, it is maximized at equilibrium, and it increases under irreversible processes. 

### Configurational Entropy of Mixing

**Binary configurational entropy on a lattice.**

Place $N_A$ indistinguishable A atoms and $N_B$ indistinguishable B atoms on $N = N_A + N_B$ lattice sites at random (the *random-mixing* or *Bragg–Williams* approximation). The number of distinguishable arrangements is the binomial coefficient:
$$\Omega = \binom{N}{N_A} = \frac{N!}{N_A!\,N_B!}.$$

The configurational entropy:
$$S_{\text{config}} = k_B\ln\Omega = k_B\ln\frac{N!}{N_A!\,N_B!} = k_B[\ln N! - \ln N_A! - \ln N_B!].$$

Applying Stirling's approximation and simplifying :
$$S_{\text{config}}  = -k_B[N_A\ln x_A + N_B\ln x_B],$$
where $x_A = N_A/N$, $x_B = N_B/N$. Per mole (setting $N = N_{\text{Av}}$ so $k_BN_{\text{Av}} = R$):
$$\boxed{\Delta S_{\text{config}}^{\text{mix}} = -R[x_A\ln x_A + x_B\ln x_B].}$$

For $c$ components:
$$\boxed{\Delta S_{\text{config}}^{\text{mix}} = -R\sum_{i=1}^c x_i\ln x_i.}$$

**Properties.** 
- $\Delta S_{\text{config}}^{\text{mix}} \geq 0$ always (since $x_i \leq 1$ so $\ln x_i \leq 0$).
- Maximum at $x_i = 1/c$ for all $i$: $\Delta S_{\text{config,max}} = R\ln c$.
- $\Delta S_{\text{config}}^{\text{mix}} \to 0$ as any $x_i \to 0$ or $x_i \to 1$ (pure component limit).
- For a binary at $x=0.5$: $\Delta S_{\text{config}}^{\text{mix}} = R\ln 2 \approx 5.76\,\text{J}\,\text{mol}^{-1}\text{K}^{-1}$.


## Solution Models
### Free Energy of Mixing — General Framework

For a binary solution of $x_A$ moles of A and $x_B = 1-x_A$ moles of B per mole of solution, define:

**Reference (mechanical mixture):** $G^{\text{ref}} = x_AG_A^\circ + x_BG_B^\circ$, where $G_A^\circ, G_B^\circ$ are molar Gibbs energies of pure A and pure B.

**Molar Gibbs energy of mixing:** $\Delta G^{\text{mix}} = G^{\text{solution}} - G^{\text{ref}} = \Delta H^{\text{mix}} - T\Delta S^{\text{mix}}$.

Every solution model specifies $\Delta H^{\text{mix}}$ and $\Delta S^{\text{mix}}$ explicitly. The full molar Gibbs energy:
$$\boxed{G^{\text{solution}} = x_AG_A^\circ + x_BG_B^\circ + \Delta G^{\text{mix}}.}$$

### The Ideal Solution Model

**Assumptions.** (a) Random mixing; (b) $\Delta H^{\text{mix}} = 0$ (A–A, A–B, B–B interactions are indistinguishable in energy).

Since $\Delta H^{\text{mix}} = 0$ and $\Delta S^{\text{mix}} = \Delta S_{\text{config}}^{\text{mix}} = -R[x_A\ln x_A + x_B\ln x_B]$:

$$\boxed{\Delta G^{\text{mix,ideal}} = RT(x_A\ln x_A + x_B\ln x_B).}$$

Note: Since $x_i \in (0,1)$, $\ln x_i < 0$, so $\Delta G^{\text{mix,ideal}} < 0$: ideal mixing always lowers the Gibbs energy. The $G^{\text{mix}}$ curve is concave upward everywhere (stable against phase separation at all compositions for all $T > 0$).

The Chemical potential of component $i$ in an ideal solution: $\mu_i^{\text{ideal}} = G_i^\circ + RT\ln x_i.$ This defines the **Raoultian standard state**: $\gamma_i = 1$ for all $x_i$ in an ideal solution. 


### The Regular Solution Model

**Assumptions.** (a) Random mixing in the Bragg–Williams mean-field approximation (configurational entropy taken as ideal); (b) Non-zero enthalpic interaction parameterized by a single constant $\Omega$. 

**Enthalpy of mixing from bond energies.**

Using a nearest-neighbor bond model with coordination number $z$. Let $\varepsilon_{AA}$, $\varepsilon_{BB}$, $\varepsilon_{AB}$ be bond energies per pair (negative for attractive). In a random binary alloy with $N_{\text{Av}}$ sites per mole, the number of A–B pairs is $\frac{1}{2}z N_{\text{Av}} \cdot 2x_Ax_B$ (the factor $2x_Ax_B$ is the probability that a random pair has one A and one B atom on adjacent sites, accounting for two orderings A–B and B–A):

$$H = \frac{z N_{\text{Av}}}{2}[x_A^2 \varepsilon_{AA} + 2x_Ax_B\varepsilon_{AB} + x_B^2\varepsilon_{BB}].$$

The reference state $H^{\text{ref}} = x_AH_A^\circ + x_BH_B^\circ = \frac{zN_{\text{Av}}}{2}[x_A\varepsilon_{AA} + x_B\varepsilon_{BB}]$. and $\Delta H^{\text{mix}} = H - H^{\text{ref}}$

$$\Delta H^{\text{mix}} = \frac{zN_{\text{Av}}}{2}[x_Ax_B(-\varepsilon_{AA}) + 2x_Ax_B\varepsilon_{AB} + x_Ax_B(-\varepsilon_{BB})] = x_Ax_B\,\Omega,$$
where:
$$\boxed{\Omega \equiv \frac{zN_{\text{Av}}}{2}[2\varepsilon_{AB} - \varepsilon_{AA} - \varepsilon_{BB}].}$$

The regular-solution molar Gibbs energy of mixing:
$$\boxed{\Delta G^{\text{mix,reg}} = \Omega\, x_Ax_B + RT(x_A\ln x_A + x_B\ln x_B).}$$

**Sign convention.** $\Omega > 0$: A–B bonds are less favorable than the average of A–A and B–B bonds (positive deviation from ideality, tendency toward phase separation); $\Omega < 0$: A–B bonds are more favorable (negative deviation, tendency toward ordering).


### Critical Temperature and Spinodal in the Regular Solution

Let $x = x_A$, $1-x = x_B$. The condition $\partial^2\Delta G^{\text{mix}}/\partial x^2 = 0$ gives the **spinodal** (instability limit):
$$\frac{\partial^2\Delta G^{\text{mix}}}{\partial x^2} = -2\Omega + \frac{RT}{x(1-x)} = 0 \implies T = \frac{2\Omega x(1-x)}{R}.$$

This is maximized at $x = 0.5$, giving the **critical temperature**:
$$\boxed{T_c = \frac{\Omega}{2R}.}$$

At $T < T_c$ and compositions near $x = 0.5$, $\partial^2G/\partial x^2 < 0$ (concave, unstable) — the system undergoes spinodal decomposition. The binodal (coexistence curve, from the common-tangent construction) lies *outside* the spinodal.

**Verification of $T_c = \Omega/(2R)$:**
At $x = 0.5$: $\partial^2\Delta G^{\text{mix}}/\partial x^2 = -2\Omega + RT/(0.5\cdot0.5) = -2\Omega + 4RT$. Setting to zero: $T = 2\Omega/(4R) = \Omega/(2R)$. 


### The Redlich–Kister Sub-Regular Model

A more flexible model replaces the single constant $\Omega$ with a composition-dependent interaction:
$$G^{xs} = x_Ax_B\sum_{n=0}^{N} L_n(x_A - x_B)^n,$$
where $L_0, L_1, L_2, \dots$ are temperature-dependent interaction parameters fitted to experimental data. This is the **Redlich–Kister (RK)** polynomial. Regular solution is the special case $N = 0$, $L_0 = \Omega$. Sub-regular solution typically uses $N = 1$: $G^{xs} = x_Ax_B(L_0 + L_1(x_A - x_B))$.

The key advantage of RK over simple regular solution: it can handle *asymmetric* $G^{xs}(x)$ curves (where the maximum/minimum is not at $x = 0.5$), which is the norm rather than the exception in real metallic systems. 

### Notes

- Ideal and regular solution models assume completely random distribution of atoms on lattice sites. In real metallic alloys, short-range order (SRO) often exists that cannot be captured by these simple models. The regular solution model is internally inconsistent because it assumes random mixing while introducing non-zero interaction energies, thereby neglecting the short-range order that those interactions would naturally produce.
- In CALPHAD modeling, the $L_n$ parameters in Redlich–Kister polynomials are commonly expressed as linear in temperature ($L_n = A_n + B_n T$). This linear approximation works well within the temperature range of the assessment but should not be extrapolated far outside it, as the true temperature dependence is more complex.
- The regular solution model assumes a composition-independent interaction parameter $\Omega$ derived from bond energies. In reality, bond energies vary with the local chemical environment. This limitation explains why multiple Redlich–Kister terms are needed to accurately fit experimental data.
- Ideal solution and dilute (ideal dilute) solution are not the same. An ideal solution follows $\mu_i = \mu_i^\circ + RT \ln x_i$ with the pure-component standard state $\mu_i^\circ = G_i^\circ$ across the entire composition range (Raoult’s law). In contrast, an ideal dilute solution uses a Henrian standard state for the solute and is valid only in the dilute limit ($x_i \to 0$).
- Regular solution entropy equals ideal solution entropy. This is correct by design. The regular solution model retains the ideal random-mixing entropy $-R \sum x_i \ln x_i$ and adds only the enthalpic interaction term $\Omega x_A x_B$. The non-ideality is therefore entirely enthalpic.
- More Redlich–Kister terms do not always mean a better model. While additional $L_n$ parameters provide a more flexible fit to data, they can lead to unphysical oscillations and poor extrapolation without strong physical justification. Standard CALPHAD practice uses the minimum number of terms needed to reproduce experimental data within uncertainty.
- 

## Phase Diagrams & the Gibbs Phase Rule


### The Gibbs Phase Rule

Consider a system of $c$ components and $\phi$ coexisting phases at equilibrium. The **independent intensive variables** needed to specify the state of each phase are: $T$, $P$, and $(c-1)$ independent mole fractions per phase (the $c$th mole fraction is $1 - \sum_{i=1}^{c-1}x_i$, not independent). Total: $\phi(c-1) + 2$ intensive variables.

**Equilibrium constraints.** Thermal equilibrium: $T^\alpha = T^\beta = \cdots$ — gives $(\phi-1)$ equations. Mechanical equilibrium: $P^\alpha = P^\beta = \cdots$ — gives $(\phi-1)$ equations. Chemical equilibrium: $\mu_i^\alpha = \mu_i^\beta = \cdots$ for each $i$ — gives $c(\phi-1)$ equations. Total constraints: $(\phi-1)(c+2)$.

**Degrees of freedom** $F =$ (total intensive variables) $-$ (constraints):
$$F = [\phi(c-1) + 2] - [(\phi-1)(c+2)] = \phi c - \phi + 2 - \phi c - 2\phi + c + 2.$$
$$= c - \phi + 2.$$
$$\boxed{F = c - \phi + 2.}$$

If $r$ independent chemical reactions constrain the system, $F = c - r - \phi + 2$. If external fields (electric, magnetic, gravitational) are present, additional variables enter and $F$ increases accordingly.

**Applications:**

| System | $c$ | $\phi$ | $F$ | Interpretation |
|---|---|---|---|---|
| Pure substance, single phase | 1 | 1 | 2 | Can independently vary $T$ and $P$ |
| Pure substance, two phases (e.g., boiling) | 1 | 2 | 1 | One degree of freedom: fix $T$, $P$ is set (or vice versa) |
| Pure substance, three phases (triple point) | 1 | 3 | 0 | Invariant: unique $T$ and $P$ |
| Binary, two phases | 2 | 2 | 2 | At fixed $P$: one degree of freedom (fix $T$, compositions set) |
| Binary, three phases (eutectic) | 2 | 3 | 1 | At fixed $P$: zero remaining DOF — eutectic point is unique $T,x$ |


### The Lever Rule

At temperature $T$ inside a two-phase ($\alpha + \beta$) field of a binary phase diagram, the equilibrium compositions are $x^\alpha$ and $x^\beta$ (read from the phase boundaries), and the overall composition is $x_0$. Let $f^\alpha$ = mole fraction of $\alpha$ phase. Conservation of species A requires:
$$f^\alpha x^\alpha + (1 - f^\alpha)x^\beta = x_0.$$

Solving:
$$f^\alpha = \frac{x_0 - x^\beta}{x^\alpha - x^\beta}, \qquad f^\beta = \frac{x^\alpha - x_0}{x^\alpha - x^\beta}.$$
$$\boxed{f^\alpha \cdot (x^\alpha - x_0) = f^\beta \cdot (x_0 - x^\beta).}$$

The geometric interpretation: $f^\beta/f^\alpha = (x_0 - x^\beta)/(x^\alpha - x_0)$ equals the ratio of the two "lever arm" lengths on the tie-line, with the fulcrum at $x_0$.

**Enthalpy (heat content) form of the lever rule.**

The total enthalpy of the two-phase mixture:
$$H = f^\alpha H^\alpha + f^\beta H^\beta.$$

This is used to compute the total latent heat released during solidification between the liquidus and solidus compositions.


### Invariant Reactions

Three-phase reactions in a binary system ($F=0$ at fixed $P$) occur at unique $(T^*, x^*)$ points called **invariant points**. Major types:

| Reaction name | Reaction | Liquid before → solid(s) after |
|---|---|---|
| Eutectic | $L \rightarrow \alpha + \beta$ | cooling from liquid produces two solids |
| Eutectoid | $\gamma \rightarrow \alpha + \beta$ | solid-state decomposition |
| Peritectic | $L + \alpha \rightarrow \beta$ | partial reaction |
| Peritectoid | $\alpha + \beta \rightarrow \gamma$ | solid-state |
| Monotectic | $L_1 \rightarrow L_2 + \alpha$ | one liquid produces another liquid + solid |

### Notes

- True equilibrium. The Gibbs phase rule counts equilibrium phases. In rapidly cooled systems (solidification faster than diffusion timescales), metastable phases can form and the "apparent" phase rule can seem violated — in fact, the metastable system is following its own, constrained phase rule with the stable phases suppressed.
- Pressure treated as fixed. For solid-state transformations at ambient pressure, fixing $P$ reduces $F$ by 1, effectively giving $F = c - \phi + 1$ (the condensed-phase phase rule). This is the form most commonly used in materials-science phase diagrams but must not be applied to high-pressure synthesis or geological phase equilibria where $P$ is genuinely variable.
- Interface effects neglected. The phase rule as derived assumes bulk phases with negligible surface area. In nanoparticle or thin-film contexts, surface/interface energy contributes to $G$ and effectively shifts equilibrium compositions (Gibbs–Thomson effect), creating apparent violations of the textbook phase diagram.
- The phase rule gives $F$, the *degrees of freedom*, not the number of phases. The number of phases $\phi$ is an input to the equation. Students often confuse "how many intensive variables can be independently varied" (the answer to the phase rule) with "how many phases are present" (which is determined by the system's history and equilibrium condition).
- In a two-phase region, either composition or temperature is free. For a binary system at fixed $P$ with two coexisting phases ($F = 2 - 2 + 1 = 1$): only *one* intensive variable (say, temperature) can be independently chosen; fixing $T$ then fixes both phase compositions $x^\alpha(T)$ and $x^\beta(T)$ from the phase diagram. Students often think the phase compositions can be adjusted freely, forgetting that the tie-line fixes them once $T$ is specified. 

## Common Tangent Construction

### Equilibrium as a Common Tangent Problem

At fixed $T, P$, equilibrium minimizes the total Gibbs energy of the system. For a binary system that can split into two phases $\alpha$ and $\beta$ with compositions $x^\alpha$ and $x^\beta$, the total Gibbs energy is:
$$G_{\text{tot}} = f^\alpha G^\alpha(x^\alpha) + f^\beta G^\beta(x^\beta),$$
subject to conservation of mass: $f^\alpha x^\alpha + f^\beta x^\beta = x_0$ and $f^\alpha + f^\beta = 1$. 


### Common Tangent Derivation via Lagrange Multipliers

Minimize $G_{\text{tot}} = f^\alpha G^\alpha(x^\alpha) + (1-f^\alpha) G^\beta(x^\beta)$ over free variables $\{f^\alpha, x^\alpha, x^\beta\}$, subject to one mass-balance constraint $h = f^\alpha x^\alpha + (1-f^\alpha)x^\beta - x_0 = 0$. Form the Lagrangian:
$$\mathcal{L} = f^\alpha G^\alpha(x^\alpha) + (1-f^\alpha)G^\beta(x^\beta) - \lambda[f^\alpha x^\alpha + (1-f^\alpha)x^\beta - x_0].$$

Stationarity conditions:

$\partial\mathcal{L}/\partial x^\alpha = 0$:
$$f^\alpha\frac{dG^\alpha}{dx^\alpha} = \lambda f^\alpha \implies \frac{dG^\alpha}{dx^\alpha}\Bigg|_{x^{\alpha,\text{eq}}} = \lambda. \qquad (1)$$

$\partial\mathcal{L}/\partial x^\beta = 0$:
$$(1-f^\alpha)\frac{dG^\beta}{dx^\beta} = \lambda(1-f^\alpha) \implies \frac{dG^\beta}{dx^\beta}\Bigg|_{x^{\beta,\text{eq}}} = \lambda. \qquad (2)$$

$\partial\mathcal{L}/\partial f^\alpha = 0$:
$$G^\alpha(x^\alpha) - G^\beta(x^\beta) - \lambda(x^\alpha - x^\beta) = 0 \implies \lambda = \frac{G^\alpha(x^\alpha) - G^\beta(x^\beta)}{x^\alpha - x^\beta}. \qquad (3)$$

Equations (1), (2), and (3) together state: the slope of $G^\alpha$ at $x^{\alpha,\text{eq}}$ equals the slope of $G^\beta$ at $x^{\beta,\text{eq}}$ (equal slopes, from (1) and (2)), and both equal the slope of the straight line connecting the two points $(x^\alpha, G^\alpha)$ and $(x^\beta, G^\beta)$ (equal chord slope, from (3)). Geometrically: a single straight line is simultaneously tangent to both $G(x)$ curves — the **common tangent**. 

$$\boxed{\frac{dG^\alpha}{dx}\Bigg|_{x^\alpha} = \frac{dG^\beta}{dx}\Bigg|_{x^\beta} = \frac{G^\alpha(x^\alpha) - G^\beta(x^\beta)}{x^\alpha - x^\beta}.}$$


### Connection to Equal Chemical Potentials

For a binary system with $G(x)$ the molar Gibbs energy at composition $x$, the chemical potentials are:
$$\mu_B - \mu_A = \frac{dG}{dx}, \quad G = x_A\mu_A + x_B\mu_B = \mu_A + x(\mu_B - \mu_A) \implies \mu_A = G - x\frac{dG}{dx}.$$

The common-tangent condition (equal slopes) $dG^\alpha/dx = dG^\beta/dx = \lambda$ implies equal $(\mu_B - \mu_A)$ in both phases. Combined with the chord-slope condition (3), one can show:
$$\mu_A^\alpha = \mu_A^\beta \quad \text{and} \quad \mu_B^\alpha = \mu_B^\beta.$$

**Proof:** From $\mu_A^\alpha = G^\alpha(x^\alpha) - x^\alpha(dG^\alpha/dx) = G^\alpha - x^\alpha\lambda$ and $\mu_A^\beta = G^\beta - x^\beta\lambda$:
$$\mu_A^\alpha - \mu_A^\beta = G^\alpha - G^\beta - \lambda(x^\alpha - x^\beta) = 0,$$
using condition (3). Similarly for $\mu_B$. 


### Spinodal vs. Binodal (Common-Tangent vs. Inflection Points)

**Binodal (coexistence curve).** The common-tangent compositions $x^\alpha_{\text{eq}}(T)$ and $x^\beta_{\text{eq}}(T)$ as a function of $T$ form the **binodal** (coexistence curves, i.e., the liquidus and solidus in a binary phase diagram). These are the compositions in stable equilibrium.

**Spinodal.** The inflection points of $G(x)$, where $\partial^2G/\partial x^2 = 0$, form the **spinodal**. Between the spinodal and binodal, the system is *metastable* — it has a free energy higher than the two-phase mixture (so a phase-separated state is ultimately favorable) but its $G(x)$ curve is locally convex ($\partial^2G/\partial x^2 > 0$), meaning small fluctuations increase $G$ and the system is stable against infinitesimal composition fluctuations. Inside the spinodal ($\partial^2G/\partial x^2 < 0$), the system is *unstable* against infinitesimal fluctuations — this is where spinodal decomposition (Module M5) occurs spontaneously. 

$$\text{Spinodal:}\; \frac{\partial^2G}{\partial x^2} = 0 \quad (\text{metastable} \to \text{unstable boundary}).$$
$$\text{Binodal:}\; \text{common tangent}\; (G^\alpha\text{ and }G^\beta\text{ equal slope and chord slope}).$$


#### Notes

- The common-tangent argument as stated assumes each individual phase's $G(x)$ is a sufficiently smooth function with local convexity in the two-phase region. CALPHAD Gibbs-energy functions can have multiple inflection points for complex phases (e.g., ordered intermetallics), requiring more careful multi-tangent constructions.
- For more than two coexisting phases (three-phase equilibrium at the eutectic point), the common-tangent generalizes to a common-tangent *line* (in a binary system) touching three separate $G$ curves at the three equilibrium compositions simultaneously. Numerically, this is found as a global Gibbs-energy minimization problem rather than a graphical tangent construction.


## Multicomponent Equilibria & CALPHAD


### General Conditions for Multicomponent, Multiphase Equilibrium

For a system of $c$ components and $\phi$ coexisting phases, the total Gibbs energy at constant $T,P$ is:
$$G_{\rm tot} = \sum_{\alpha=1}^\phi \sum_{i=1}^c n_i^\alpha \mu_i^\alpha,$$
where $n_i^\alpha$ is the amount of component $i$ in phase $\alpha$. Minimize subject to mass-balance constraints $\sum_\alpha n_i^\alpha = N_i^{\rm tot}$ for each $i$ (using Lagrange multipliers $\lambda_i$):

$$\mathcal{L} = \sum_{\alpha,i} n_i^\alpha \mu_i^\alpha - \sum_i \lambda_i \left(\sum_\alpha n_i^\alpha - N_i^{\rm tot} \right).$$

Stationarity w.r.t. $n_i^\alpha$ yields $\mu_i^\alpha = \lambda_i$ for all $\alpha$, hence:
$$\boxed{\mu_i^\alpha = \mu_i^\beta = \cdots \quad \text{for all } i \text{ and all phase pairs}.}$$

This is the fundamental condition: there is no thermodynamic driving force for transfer of component $i$ between phases ($\mu_i^\alpha = \mu_i^\beta$). Spatial gradients appear only in non-equilibrium transport descriptions.

Thermal and mechanical equilibrium require $T^\alpha = T^\beta = \cdots$ and $P^\alpha = P^\beta = \cdots$. For systems with external fields or interfaces, additional constraints (e.g., electrochemical potential equality for charged species) apply.


### The Common Tangent Hyperplane

For $c > 2$, the molar Gibbs energy $G_m^\alpha$ is a function of $(c-1)$ independent mole fractions — a hypersurface in $c$-dimensional space. The equilibrium condition $\mu_i^\alpha = \mu_i^\beta$ for all $i$ and all phase pairs means: the tangent *hyperplane* to the $G$ hypersurface of each phase at the equilibrium composition is the same for all phases simultaneously. This is the common tangent hyperplane — a direct generalization of the common tangent line in the binary case. For a ternary system ($c=3$), $G_m(x_1,x_2)$ is a surface in 3D space; the common tangent plane simultaneously touches the $G$ surfaces of all coexisting phases. The equilibrium compositions are the tangent points. In computational implementations, the common-tangent condition is rarely solved graphically. Instead, global Gibbs-energy minimization algorithms locate the set of phase amounts and compositions that yield the lowest total $G$ while satisfying mass balance.

### The CALPHAD Methodology

The CALculation of PHAse Diagrams (CALPHAD) method consists of three closely connected activities: development of Gibbs-energy models, thermodynamic parameter assessment, and extrapolation to multicomponent systems. CALPHAD does not store phase diagrams directly. Instead, it stores thermodynamically consistent Gibbs-energy functions for all relevant phases. Equilibrium calculations are then performed by minimizing the total Gibbs energy of the system subject to mass-balance constraints.

#### Step 1: Gibbs-Energy Model for Each Phase

Each phase $\phi$ is assigned a Gibbs-energy expression

$$
G_m^\phi = G_m^{\phi,\text{ref}} + G_m^{\phi,\text{ideal}} + G_m^{\phi,\text{xs}} + G_m^{\phi,\text{add}},
$$

where $G_m^{\phi,\text{ref}}$ is the reference contribution, $G_m^{\phi,\text{ideal}}$ is the ideal-mixing term, $G_m^{\phi,\text{xs}}$ is the excess (non-ideal) contribution, and $G_m^{\phi,\text{add}}$ contains magnetic, ordering, or other phase-specific effects.

For most conventional CALPHAD databases, pressure effects are neglected and Gibbs energies are represented primarily as functions of temperature.

In the SGTE (Scientific Group Thermodata Europe) unary database, the temperature dependence of the pure-component Gibbs-energy functions is represented by polynomial expressions such as

$$
G_m^{\phi,\text{ref}}(T) = a + bT + cT\ln T + dT^2 + eT^{-1} + fT^3 + \cdots,
$$

where the coefficients are fitted to thermochemical data including heat capacities ($C_P$), enthalpies, and entropies.

**Compound Energy Formalism (CEF)**

Many technologically important phases, including intermetallic compounds, carbides, nitrides, oxides, and ordered solid solutions, are described using the Compound Energy Formalism (CEF), in which the crystal structure is represented by multiple sublattices.

A schematic Gibbs-energy expression is
$$
G_m = G_{\rm end-member} + RT\sum_s\sum_i y_i^{(s)}\ln y_i^{(s)} + G^{\rm xs},
$$
where $y_i^{(s)}$ is the site fraction of species $i$ on sublattice $s$, $G_{\rm end-member}$ represents the weighted contribution of end-member configurations, and $G^{\rm xs}$ contains interaction terms.

The full CEF formulation contains end-member energies, sublattice interaction parameters, reciprocal terms, and other contributions. This formalism naturally captures long-range ordering and complex crystal chemistry.

#### Step 2: Assessment of Binary and Ternary Subsystems

Interaction parameters, such as the Redlich-Kister coefficients $L_n^{ij}$ for substitutional phases and analogous parameters in CEF models, are optimized against available experimental and computational data. These data typically include phase-diagram measurements (liquidus, solidus, invariant reactions), enthalpies of mixing, heat capacities, activities, chemical potentials, and increasingly first-principles (DFT) calculations.

Traditionally, parameter assessment is performed using weighted nonlinear least-squares optimization (e.g., PARROT-type methods). Bayesian approaches are increasingly used for uncertainty quantification and probabilistic assessments.

Because all thermodynamic properties are derived from a common Gibbs-energy function, thermodynamic consistency is automatically maintained, including compliance with Gibbs-Duhem relations. The resulting descriptions must also satisfy the Gibbs phase rule.

#### Step 3: Extrapolation to Higher-Order Systems

Binary and ternary descriptions are combined to construct multicomponent databases. The most common extrapolation schemes are those of Muggianu, Kohler, and Toop, which use lower-order interaction parameters to estimate thermodynamic properties in higher-order systems.

As a first approximation, multicomponent equilibria can often be predicted without introducing additional fitting parameters. In practice, however, explicit ternary, quaternary, or higher-order interaction parameters are frequently introduced when sufficient experimental or computational data are available.

The resulting thermodynamic database can be used to calculate phase diagrams, phase fractions, chemical potentials, driving forces for phase transformations, solidification paths, and diffusion-controlled evolution when coupled to mobility databases such as DICTRA.


### Constrained Gibbs Energy Minimization

Given $c$ components and $\phi_{\text{candidate}}$ candidate phases, find phase amounts $n^\alpha$ and compositions $\{x_i^\alpha\}$ minimizing:
$$G_{\text{tot}} = \sum_{\alpha=1}^{\phi_{\text{candidate}}} n^\alpha G_m^\alpha(T,P,\{x_i^\alpha\})$$
subject to:
$$\sum_{\alpha} n^\alpha x_i^\alpha = N_i \quad (i=1,\dots,c), \qquad n^\alpha \geq 0, \qquad \sum_i x_i^\alpha = 1 \;\forall\,\alpha.$$

This is a nonlinear programming (NLP) problem. Modern CALPHAD software (Thermo-Calc, pycalphad, OpenCalphad) solves the constrained minimization using a combination of tangent-plane stability analysis, simplex/active-set methods, sequential linear programming, interior-point, and Newton-type iterations. The KKT conditions are equivalent to the equal-chemical-potential conditions derived earlier. 

Global minimization is required because multiple local minima may exist (different phase assemblages). Algorithms often combine convex hull construction in composition space with local optimizers. Uncertainty quantification via Monte Carlo sampling of assessed parameters is increasingly common.


### The $T_0$ Temperature

**Definition.** For a binary alloy at composition $x_0$, the $T_0$ temperature is where the Gibbs energies per mole of the two competing phases are equal *at the same composition*:
$$G_m^L(T_0, x_0) = G_m^S(T_0, x_0).$$ 
$T_0$ is the highest temperature below which diffusionless solidification (partitionless, $k_v\to1$) is thermodynamically possible. For $T < T_0$: the solid can form at composition $x_0$ without any composition change and have lower Gibbs energy — diffusionless trapping is thermodynamically permitted. For $T > T_0$: diffusionless solidification at $x_0$ would produce a solid with *higher* Gibbs energy than the liquid — thermodynamically impossible. The locus of $T_0(x)$ across all compositions is the **$T_0$ curve** on the phase diagram, which lies between the liquidus and solidus curves and converges to the equilibrium melting point of each pure component. In $c$-component systems, $T_0$ surfaces (or hypersurfaces) are defined analogously by equal $G_m$ at identical composition vectors.


### Other Additional Contributions

For ferromagnetic phases:
$$G^{\rm mag} = RT \ln(\beta + 1) \cdot f(\tau), \quad \tau = T/T_C,$$
with different polynomials $f(\tau)$ above and below the Curie temperature $T_C$ (full model includes composition dependence of $\beta$ and $T_C$). This term significantly affects phase stability in Fe-, Co-, Ni-based systems. 

While most assessments are performed at $P = 1$ bar, high-pressure extensions use volume integrals:
$$G(T,P) = G(T,P_0) + \int_{P_0}^P V(T,P')\,dP'.$$
Equations of state such as Birch–Murnaghan are commonly employed for solids.


**Formula Summary**

| Quantity / Concept | Formula / Expression | Notes / Reference |
|---|---|---|
| Equilibrium condition | $\mu_i^\alpha = \mu_i^\beta \ \forall i, \alpha,\beta$ | Core of CALPHAD |
| Total $G$ minimization | $\min G_{\rm tot}$ s.t. mass balance | KKT conditions |
| SGTE unary reference | $G = a + bT + cT\ln T + dT^2 + \cdots$ | Dinsdale 1991 |
| Redlich–Kister excess | $G^{\rm xs} = x_i x_j \sum_{n} L_n (x_i - x_j)^n$ | Sub-regular models |
| CEF (sublattice model) | Site fractions + ideal config. entropy + excess | Ordered phases [Hillert & Staffansson, 1970] |
| Muggianu extrapolation | Weighted binary excesses | Higher-order systems |
| $T_0$ condition | $G_m^L(x,T_0) = G_m^S(x,T_0)$ | Partitionless solidification |


### Notes

- Validity of the extrapolation to higher-order systems. Geometric extrapolation from binary/ternary databases to quaternary and higher systems assumes no qualitatively new interactions appear in higher-order systems that are not captured by binary/ternary sub-systems. This is an approximation that works remarkably well in practice for metallic systems but can fail when quaternary or higher-order compounds or miscibility gaps exist that have no binary/ternary analog.
- Gibbs energy model validity range. The polynomial $G_m(T)$ expressions are fitted over a specific temperature range and should not be extrapolated far outside it (particularly to very low temperatures, where quantum effects invalidate the classical polynomial, or to very high temperatures beyond the data range).
- Magnetic and ordering contributions. Many CALPHAD databases use semi-empirical models for magnetic contributions to $G$ (the Hillert–Jarl model for ferromagnetic elements) and for ordered phases (sublattice/compound-energy formalism). These add significant complexity beyond the simple Redlich–Kister formalism.
- Neglect of vibrational, electronic, and anharmonic effects beyond polynomials. Higher-order anharmonic contributions or explicit phonon calculations (e.g., via density-functional theory) are usually not included; the SGTE polynomial is an effective fit.
- CALPHAD is a sophisticated thermodynamic *model* whose parameters are fitted to experimental data. It can extrapolate to conditions not directly measured (e.g., ternary/quaternary equilibria from binary assessments), but this extrapolation is only as good as the underlying binary/ternary assessments and the physical validity of the geometric mixing rule. The term "prediction" in CALPHAD literature usually means "calculation from an assessed database," not a first-principles prediction.
-  The solidus temperature is the equilibrium liquidus/solidus boundary at the equilibrium solid composition, which involves partitioning. $T_0$ is a *different* temperature at which two phases have equal Gibbs energy *at the same composition* — it is relevant only for diffusionless (partitionless) solidification. $T_0$ lies *below* the liquidus and *above* the solidus for $k < 1$ alloys. Confusing these temperatures leads to errors in interpreting rapid-solidification or additive-manufacturing microstructures.

## Driving Forces for Phase Transformations

The Gibbs-energy driving force for a phase transformation at fixed $T, P$ is the decrease in total Gibbs energy per unit volume (or per mole) when the transformation proceeds. For solidification (liquid $\to$ solid):
$$\Delta G_v = G_m^L(T, \{x_i^L\}) - G_m^S(T, \{x_i^S\}) \quad [\text{J/mol}]$$
or per unit volume: $\Delta G_v = \Delta G_m / V_m$ [J/m³], where $V_m$ is the molar volume. $\Delta G_v > 0$ (defined as the magnitude of the driving force, i.e., the Gibbs-energy difference favoring solidification) for temperatures below the liquidus/melting point. 

Throughout this module, the symbol $(\Delta G_v)$ denotes the positive magnitude of the thermodynamic driving force per unit volume available for transformation. For example, during solidification below the melting point, $G_S < G_L,$ so that the actual Gibbs-energy change of the system is $\Delta G_{\text{system}} = G_S-G_L <0.$

The quantity used in nucleation and growth theories is instead $\Delta G_v = G_L-G_S -\Delta G_{\text{system}} > 0,$ which represents the amount of free energy available to drive the transformation. This convention is standard in the solidification and nucleation literature and is adopted throughout the present module.


### First-Order (Linear) Approximation for a Pure Metal

$$\Delta G_v \approx L\Delta T/T_m$$

Write $\Delta G_m(T) = G_m^L(T) - G_m^S(T)$ for a pure metal. At the equilibrium melting temperature $T_m$, both phases have equal Gibbs energy by definition:
$$\Delta G_m(T_m) = 0. \quad \text{(definition of }T_m\text{)}$$

Differentiate $\Delta G_m$ with respect to $T$:
$$\frac{d\Delta G_m}{dT} = \frac{dG_m^L}{dT} - \frac{dG_m^S}{dT} = -S_m^L - (-S_m^S) = -(S_m^L - S_m^S) = -\Delta S_m.$$

At $T_m$, the two phases are in equilibrium, so $G_m^L = G_m^S$ and $\Delta G_m(T_m) = 0 = \Delta H_m(T_m) - T_m\Delta S_m(T_m)$, giving:
$$\Delta S_m(T_m) = \frac{\Delta H_m(T_m)}{T_m} = \frac{L}{T_m},$$
where $L = \Delta H_m^{\text{fus}} = H_m^L(T_m) - H_m^S(T_m)$ is the molar latent heat of fusion (positive: heat is released upon solidification $\Rightarrow$ solid has lower enthalpy).

Apply a first-order Taylor expansion of $\Delta G_m(T)$ about $T_m$ with $\Delta T = T_m - T \geq 0$ (undercooling):
$$\Delta G_m(T) \approx \Delta G_m(T_m) + \frac{d\Delta G_m}{dT}\Bigg|_{T_m}(T - T_m) = 0 + (-\Delta S_m(T_m))(T - T_m).$$

Since $T - T_m = -\Delta T$:
$$\Delta G_m(T) \approx \Delta S_m(T_m)\cdot\Delta T = \frac{L\,\Delta T}{T_m}.$$

$$\boxed{\Delta G_v \approx \frac{L\,\Delta T}{T_m} \quad [\text{J/mol}].}$$

**Verification.** At $\Delta T = 0$: $\Delta G_v = 0$  (no driving force at equilibrium). At $\Delta T > 0$ (undercooling): $\Delta G_v > 0$  (solidification is thermodynamically favorable). As $\Delta T$ increases: driving force increases linearly  (qualitatively correct).

### Assumptions Underlying the Dilute-Alloy Approximation

Unlike the pure-metal case, the driving force for solidification of an alloy generally depends upon temperature, composition, partitioning behavior, and the thermodynamic properties of both phases. No universal closed-form expression exists. The approximation developed below is valid only under the assumptions of:

1. dilute-solution thermodynamics,
2. local equilibrium at the interface,
3. small departures from the liquidus temperature,
4. approximately constant partition coefficient (k), and
5. negligible composition dependence of the latent heat.

Under these assumptions, the driving force may be expressed in a simplified analytical form that provides useful physical insight and is widely employed in solidification theory. For quantitative calculations away from these limits, CALPHAD-based evaluation of the phase Gibbs energies should be used instead.


### Second-Order Correction (Thompson–Spaepen Formula)

**Including the $\Delta C_P$ correction.**

Expand $\Delta G_m(T)$ to second order in $\Delta T$:
$$\Delta G_m(T) \approx \underbrace{\Delta G_m(T_m)}_{=\,0} + \frac{d\Delta G_m}{dT}\Bigg|_{T_m}(-\Delta T) + \frac{1}{2}\frac{d^2\Delta G_m}{dT^2}\Bigg|_{T_m}(\Delta T)^2.$$

The second derivative:
$$\frac{d^2\Delta G_m}{dT^2} = -\frac{d\Delta S_m}{dT} = -\frac{\Delta C_P}{T},$$
where $\Delta C_P = C_P^L - C_P^S$ is the difference in heat capacities (typically $\Delta C_P > 0$ for metals). Evaluating at $T_m$:
$$\Delta G_m(T) \approx \frac{L\,\Delta T}{T_m} - \frac{\Delta C_P}{2T_m}(\Delta T)^2.$$

A more accurate *non-perturbative* form due to Thompson & Spaepen, accounting for the temperature dependence of $L$ via $\int_{T}^{T_m}\Delta C_P\,dT'$ exactly:
$$\boxed{\Delta G_m(T) = L\frac{\Delta T}{T_m}\cdot\frac{2T}{T+T_m}.}$$

The Thompson–Spaepen expression reduces to the first-order result $L\Delta T/T_m$ for $\Delta T\ll T_m$ (since $2T/(T+T_m)\to1$) and gives a more accurate result at larger undercoolings. For metals, this correction is significant only for $\Delta T > 100\,\text{K}$.

### Physical Interpretation of the Parallel-Tangent Construction

For a substitutional alloy, nucleation occurs under the constraint that long-range diffusion cannot instantaneously establish the equilibrium compositions given by the common-tangent construction. The relevant driving force is therefore not the equilibrium free-energy difference between the two phases but rather the free-energy reduction attainable while maintaining the diffusion constraints imposed by the surrounding matrix.

This constrained driving force is obtained geometrically using a **parallel-tangent construction**. The slope of the tangent corresponds to the diffusion potential (or chemical-potential difference) governing atomic redistribution. The resulting free-energy difference measures the maximum decrease in Gibbs energy available for formation of a nucleus while preserving local diffusion equilibrium conditions.

Consequently, the parallel-tangent construction generally predicts a smaller driving force than that obtained from the equilibrium common-tangent construction and is therefore the appropriate quantity for classical nucleation calculations in multicomponent alloys.


### Driving Force for Alloy Solidification

**Driving force accounting for composition change.**

For an alloy, the driving force depends not only on temperature but also on the compositions of the liquid and solid phases. Using the common-tangent construction (Module T7) or direct CALPHAD evaluation:
$$\Delta G_m^{\text{alloy}}(T, x^L, x^S) = G_m^L(T, x^L) - G_m^S(T, x^S).$$

In the **parallel-tangent** construction relevant to nucleation:
$$\Delta G_m^{\text{nucl}} = G_m^L(T, x^L) - [G_m^S(T, x^{S,*}) + (x^L - x^{S,*})\mu^{\text{diff}}],$$
where $x^{S,*}$ is the composition of the nucleating solid and $\mu^{\text{diff}}$ is the diffusion potential — this is the correct thermodynamic driving force for nucleation of a solid embryo of composition $x^{S,*}$ from a liquid of composition $x^L$. 

Near the liquidus at undercooling $\Delta T$:
$$\Delta G_m^{\text{alloy}} \approx \frac{\Delta S^L_m\,\Delta T}{1-k},$$
where the $(1-k)$ factor (with $k$ the partition coefficient, Module S4) accounts for the solute redistribution.

### Driving Force Expressed Through Chemical Potentials

The Gibbs-energy difference between phases and the chemical-potential description of transformation driving forces are equivalent thermodynamic representations.

For a multicomponent system, the differential change in Gibbs energy is
$$dG = \sum_i \mu_i\, dN_i,$$
at constant temperature and pressure. The driving force for transforming material from a parent phase (\alpha) to a product phase (\beta) may therefore be written as

$$
\Delta G =\sum_i N_i \left(\mu_i^{\alpha} - \mu_i^{\beta} \right).
$$

A phase transformation proceeds spontaneously whenever the chemical potentials in the parent phase exceed those in the product phase in a manner that lowers the total Gibbs energy of the system.

This formulation is particularly important in diffusion theory, CALPHAD calculations, interface kinetics, and phase-field models, where gradients of chemical potential serve as the fundamental thermodynamic driving forces for mass transport and phase evolution.


### Driving Force for Other Transformations

**Solid-state precipitation ($\alpha \to \beta + \alpha'$).** The driving force is the Gibbs energy decrease associated with the precipitate forming at composition $x^\beta$:
$$\Delta G^{\text{precip}} = G_m^\alpha(x^\alpha) - [f^\beta G_m^\beta(x^\beta) + (1-f^\beta)G_m^{\alpha'}(x^{\alpha'})].$$

Graphically: this is the vertical distance from the parent-phase $G$ curve to the common tangent between $G^{\alpha'}$ and $G^\beta$ (the energy of the two-phase mixture), evaluated at the overall composition $x^\alpha$. 

**Spinodal decomposition driving force.** The driving force per unit volume for composition fluctuation $\delta c$ inside the spinodal:
$$\Delta G \approx \frac{1}{2}\frac{d^2G_m}{dx^2}(\delta c)^2 < 0,$$
since $d^2G_m/dx^2 < 0$ inside the spinodal. The magnitude of the spinodal driving force grows with increasing $|\delta c|^2$, which is why spinodal decomposition produces a characteristic wavelength rather than nucleating discrete particles. 

### Role of Gradient Energy in Spinodal Decomposition

The negative curvature of the homogeneous free-energy curve determines whether infinitesimal composition fluctuations are thermodynamically amplified. However, the curvature term alone does not determine the characteristic morphology of the decomposition process.

In the Cahn–Hilliard description, the total free-energy functional contains an additional gradient-energy contribution,
$$
G = \int \left[g(c) + \frac{\kappa}{2} |\nabla c|^2 \right] dV,
$$

where (\kappa) is the gradient-energy coefficient. The first term favors separation into compositionally distinct regions whenever

$$
\frac{\partial^2 g}{\partial c^2}<0,
$$

whereas the gradient term penalizes the formation of sharp composition variations.

The competition between these two effects causes fluctuations of intermediate wavelength to grow most rapidly, producing the characteristic length scale observed during spinodal decomposition. The existence of a preferred wavelength therefore arises from the combined action of the negative free-energy curvature and the positive gradient-energy penalty.


**Formula Summary**

| Quantity | Formula | Valid when | Ref. |
|---|---|---|---|
| Pure-metal driving force, first order | $\Delta G_v = L\Delta T/T_m$ | $\Delta T/T_m \ll 1$ | |
| Pure-metal driving force, Thompson–Spaepen | $\Delta G_m = L(\Delta T/T_m)(2T/(T+T_m))$ | All undercoolings | [Thompson & Spaepen, 1979] |
| Molar entropy of fusion | $\Delta S_m = L/T_m$ | Pure metal, $T=T_m$ | |
| Second-order correction | $\Delta G_m \approx L\Delta T/T_m - \Delta C_P(\Delta T)^2/(2T_m)$ | $\Delta T\ll T_m$ | [Derived above] |
| Nucleation barrier (from Module S1 connection) | $\Delta G^* = 16\pi\gamma^3/(3\Delta G_v^2)$ | Classical nucleation theory | |


### Notes

- Temperature independence of $L$ and $\Delta S$. The first-order approximation $\Delta G_v \approx L\Delta T/T_m$ assumes $L$ and $\Delta S_m$ are independent of temperature. In reality, $L(T) = L(T_m) + \int_{T_m}^T\Delta C_P\,dT'$. For aluminum ($L = 10.7\,\text{kJ/mol}$, $T_m = 933\,\text{K}$, $\Delta C_P\approx5\,\text{J/mol\,K}$), the correction at $\Delta T = 100\,\text{K}$ is $\sim5\Delta C_P/L \approx 5\%$ — significant for quantitative work but negligible for order-of-magnitude estimates.
- Single equilibrium melting point. The formula $\Delta G_v \approx L\Delta T/T_m$ applies to *pure metals*. For alloys, the equilibrium temperature is composition-dependent (the liquidus temperature), and $\Delta T = T_L(x^L) - T$ is the local undercooling below the liquidus at the actual liquid composition. The linearization is then $\Delta G_v \approx \Delta S^L \Delta T$ where $\Delta S^L$ is an effective entropy of solidification that depends on the alloy system.
- Neglect of volumetric strain energy. For solid-state transformations, elastic strain energy from the misfit between parent and product phases opposes the transformation and reduces the effective driving force. For solidification (liquid→solid), elastic contributions are generally negligible, but for solid-state precipitation in constrained geometries, strain energy can be $\sim10$–$50\%$ of $\Delta G_m$. 
