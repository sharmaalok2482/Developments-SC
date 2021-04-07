CLASS zkc_cl_abap_unit DEFINITION for testing

  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
  PRIVATE SECTION.
  METHODS first_test for testing raising cx_static_check.
ENDCLASS.



CLASS zkc_cl_abap_unit IMPLEMENTATION.
method first_test.
    Data: iv_num1 type i VALUE 3,
          iv_num2 type i value 6,
          iv_sum type i.

          iv_sum = iv_num1 + iv_num2.

  endmethod.

ENDCLASS.

*class ltcl_ definition final for testing
*  duration short
*  risk level harmless.
*
*  private section.
*    methods:
*      first_test for testing raising cx_static_check.
*endclass.
*
*
*class ltcl_ implementation.
*
*  method first_test.
*    cl_abap_unit_assert=>fail( 'Implement your first test here' ).
*  endmethod.
*
*endclass.
