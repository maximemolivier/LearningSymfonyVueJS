<?php

namespace App\Controller\Admin;

use App\Entity\Boisson;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Vich\UploaderBundle\Form\Type\VichImageType;

class BoissonCrudController extends AbstractCrudController
{


    public function __construct(private string $uploadDir)
    {
    }

    public static function getEntityFqcn(): string
    {
        return Boisson::class;
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
    }

}
