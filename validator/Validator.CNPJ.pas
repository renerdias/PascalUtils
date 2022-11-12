unit Validator.CNPJ;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Utils.Common;

type

  { TCNPJ }
  TCNPJ = object
  strict private
    FCNPJ: string;
  public
    function IsCNPJ(const AValue: string): boolean; static;
    property CNPJ: string read FCNPJ write FCNPJ;
  end;

implementation

{ TCNPJ }

function TCNPJ.IsCNPJ(const AValue: string): boolean; static;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: integer;
  d1, d2: integer;
  digitado, calculado, num: string;
begin
  num := TUtils.GetOnlyNumber(AValue);
  if (Length(num) <> 14) then
  begin
    Result := False;
  end
  else
  begin
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    n10 := StrToInt(num[10]);
    n11 := StrToInt(num[11]);
    n12 := StrToInt(num[12]);
    d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 +
      n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 +
      n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    calculado := IntToStr(d1) + IntToStr(d2);
    digitado := num[13] + num[14];
    if calculado = digitado then
      Result := True
    else
      Result := False;
  end;
end;

end.
