import netCDF4 as nc
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation, PillowWriter


ncfile = 'result.nc'

ds = nc.Dataset(ncfile)

xx = np.array(ds['xx'][:])
yy = np.array(ds['yy'][:])

psi  = np.array(ds['psi'][:])
psi2 = np.array(ds['psi2'][:])


def plot_sample():
    fig, axs = plt.subplots(nrows=2, ncols=2, figsize=(9, 7),
            sharex=True, sharey=True)

    axs[0,0].contourf(psi2[  0], cmap=plt.cm.magma)
    axs[0,1].contourf(psi2[250], cmap=plt.cm.magma)
    axs[1,0].contourf(psi2[500], cmap=plt.cm.magma)
    axs[1,1].contourf(psi2[999], cmap=plt.cm.magma)

    plt.show()


def plot_live(use_3d=False, save=False):

    fig = plt.figure(figsize=(7, 7))
    if use_3d:
        ax = fig.add_subplot(projection='3d')
    else:
        ax = fig.add_subplot()

    def animate(i):
        print("writing simulation of timestep t = {:>3} of 100".format(i))
        ax.clear()

        if use_3d:
            ax.plot_surface(xx, yy, psi2[i, :, :], cstride=3, rstride=3,
                    cmap=plt.cm.magma)
            ax.set_zlim([0, 7])
        else:
            ax.contourf(psi2[i, :, :], vmin=-1, cmap=plt.cm.magma)

    ani = FuncAnimation(fig, animate, 100, interval=20, blit=False)
    if save:
        writer = PillowWriter(fps=30)
        ani.save('animation.gif', writer=writer)


    # plt.show()

plot_live(use_3d=True, save=True)

