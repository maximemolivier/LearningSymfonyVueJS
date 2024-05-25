<?php

namespace App\Controller\Admin;

use App\Form\BaseType;
use App\Form\IngredientType;
use App\Form\PizzaType;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\FormField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use Symfony\Component\Form\FormTypeInterface;
use App\Entity\Base;
use App\Entity\Ingredient;
use App\Entity\Pizza;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use Vich\UploaderBundle\Form\Type\VichImageType;

class PizzaCrudController extends AbstractCrudController
{

    public function __construct(private string $uploadDir)
    {

    }

    public static function getEntityFqcn(): string
    {
        return Pizza::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions->add(Crud::PAGE_INDEX, Action::DETAIL);
    }


    public function configureFields(string $pageName): iterable
    {
        yield IdField::new('id')
            ->onlyOnIndex();
        yield TextField::new('nom');
        yield MoneyField::new('prix')
            ->setCurrency('EUR');
        yield TextField::new('imageFile', 'Image')
            ->setFormType(VichImageType::class)
            ->onlyOnForms();
        yield ImageField::new('image', 'Image')
            -> hideOnForm()
            -> setBasePath($this->uploadDir)
            -> setUploadDir($this->uploadDir);
        yield AssociationField::new('ingredients', 'Ingrédients')
            ->setCrudController(IngredientCrudController::class)
            ->setTemplatePath('admin/pizza/detail.html.twig');
        yield AssociationField::new('base', 'Base')
            ->setCrudController(BaseCrudController::class);
    }
    
}
