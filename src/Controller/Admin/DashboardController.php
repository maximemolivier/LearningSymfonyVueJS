<?php

namespace App\Controller\Admin;

use App\Entity\Base;
use App\Entity\Boisson;
use App\Entity\Ingredient;
use App\Entity\Pizza;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    /**
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        return $this->redirect($adminUrlGenerator->setController(PizzaCrudController::class)->generateUrl());

    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Dashboard Admin');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-pizza-slice');
        yield MenuItem::linkToCrud('Pizza', '', Pizza::class);
        yield MenuItem::linkToCrud('Base Pizza', '', Base::class);
        yield MenuItem::linkToCrud('Ingrédient', '', Ingredient::class);
        yield MenuItem::linkToCrud('Boisson', '', Boisson::class);
        yield MenuItem::linkToRoute('Retour au site','fa fa-home','app_index');
    }
}
