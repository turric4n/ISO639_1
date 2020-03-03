unit ISO639_1_Locator_Service;

interface

type
  IISO639_1_Locator_Service = interface['{4626445B-0F4C-4A7B-8373-FA270B43EC01}']
    function ISO639_1ToLangName(const Code : string) : string;
    function LangName2ISO639_1(const Name : string) : string;
  end;

implementation

end.
