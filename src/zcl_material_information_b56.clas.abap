CLASS zcl_material_information_B56 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        matnr               TYPE I_Product-product
      RETURNING
        VALUE(material_art) TYPE I_Product-producttype.
ENDCLASS.



CLASS zcl_material_information_B56 IMPLEMENTATION.


  METHOD get_material_art.
    DATA material TYPE I_Product.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE ABAP_BOOLEAN .


DATA(sy_DATUM342) = cl_abap_context_info=>get_system_date( ).
    PRODUCTION_DATE = sy_DATUM342.

    SELECT SINGLE FROM i_product FIELDS producttype WHERE product = @matnr INTO CORRESPONDING FIELDS OF @material .
    material_art = material-producttype.

  ENDMETHOD.




  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_information_B56.
    material_info = NEW zcl_material_information_B56(  ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.

