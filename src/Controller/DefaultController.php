<?php

namespace App\Controller;

use App\Entity\Pizza;
use App\Repository\BoissonRepository;
use App\Repository\IngredientRepository;
use App\Repository\PizzaRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController
{
    #[Route('/', name: 'app_index')]
    public function index(PizzaRepository $Pr, BoissonRepository $Br): Response
    {
        $boissons = $Br->findBy([], [], 3, 0);
        return $this->render('pizza/index.html.twig', [
            'boissons' => $boissons,
        ]);
    }

    #[Route('/pizzas', name: 'app_pizzas')]
    public function pizzas(Request $request,PizzaRepository $Pr): Response
    {
        $pizzas = $Pr->findAll();
        $sort = $request->query->get('sort', 'prix_asc');

        if ($sort === 'prix_asc') {
            $pizzas = $Pr -> PrixASC();
        } elseif ($sort === 'prix_desc') {
            $pizzas = $Pr -> PrixDESC();
        }

        return $this->render('pizza/pizzas.html.twig', [
            'pizzas' => $pizzas,
        ]);
    }


    #[Route('/boissons', name: 'app_boissons')]
    public function boissons(BoissonRepository $Br)
    {
        $boissons = $Br->findAll();
        return $this->render('pizza/boissons.html.twig', [
            'boissons' => $boissons,
        ]);
    }

    #[Route('/pizza/{id}', name: 'app_pizza')]
    public function pizza(Pizza $pizza): Response
    {
        return $this->render('pizza/pizza.html.twig', [
            'pizza' => $pizza,
        ]);
    }

}
