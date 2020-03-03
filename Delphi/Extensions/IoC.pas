unit IoC;

interface

uses
  Spring.Container,
  ISO639_1_Locator_Service,
  Turricans_ISO639_1_Locator_Service;

type
  TRegisterServices = class
    public
      class procedure RegisterServices;
  end;

implementation

{ TRegisterServices }

class procedure TRegisterServices.RegisterServices;
begin
  GlobalContainer.RegisterType<TFastISO639_1_Locator>.Implements<IISO639_1_Locator_Service>('Turrican').AsSingleton;
  GlobalContainer.Build;
end;

end.
