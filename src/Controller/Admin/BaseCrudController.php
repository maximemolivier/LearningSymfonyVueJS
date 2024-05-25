<?php

namespace App\Controller\Admin;

use App\Entity\Base;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class BaseCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Base::class;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
