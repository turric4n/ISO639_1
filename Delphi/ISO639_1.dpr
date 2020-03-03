program ISO639_1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Generics.Collections,
  Spring.Container,
  IoC in 'Extensions\IoC.pas',
  ISO639_Exceptions in 'Domain\Exceptions\ISO639_Exceptions.pas',
  ISO639_1_Locator_Service in 'Domain\Services\ISO639_1_Locator_Service.pas',
  Turricans_ISO639_1_Locator_Service in 'Domain\Services\Turricans_ISO639_1_Locator_Service.pas';

begin
  try
    TRegisterServices.RegisterServices;
    var a := GlobalContainer.Resolve<IISO639_1_Locator_Service>;
    var c := a.ISO639_1ToLangName('ab');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
