unit Turrican_ISO639_1_Tests;

interface

uses

  DUnitX.TestFramework,
  Spring.Container,
  ISO639_Exceptions,
  ISO639_1_Locator_Service;

type
  [TestFixture]
  TTurricanISO639_Tests = class(TObject)
  private
    fturricansIso639Service : IISO639_1_Locator_Service;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure ShouldServiceInstanced;
    [Test]
    procedure ShouldRaiseExceptionWhenIncorrectIsoCode;
    [Test]
    procedure ShouldRaiseExceptionWhenIncorrectNameCode;

    [Test]
    [TestCase('TestA','ab,Abkhaz')]
    [TestCase('TestB','ja,Japanese')]
    [TestCase('TestC','zu,Zulu')]
    procedure ShouldReturnValidNames(const AValue1 : string; const AValue2 : string);

    [Test]
    [TestCase('TestA','Abkhaz,ab')]
    [TestCase('TestB','Japanese,ja')]
    [TestCase('TestC','Zulu,zu')]
    procedure ShouldReturnValidCodes(const AValue1 : string; const AValue2 : string);

    [Test]
    [TestCase('TestA','Abkhaz,ja')]
    [TestCase('TestB','Japanese,ab')]
    [TestCase('TestC','Zulu,ro')]
    procedure ShouldReturnInvalidCodes(const AValue1 : string; const AValue2 : string);

    [Test]
    [TestCase('TestA','ja,Abkhaz')]
    [TestCase('TestB','ab,Japanese')]
    [TestCase('TestC','ro,Zulu')]
    procedure ShouldReturnInvalidNames(const AValue1 : string; const AValue2 : string);
  end;

implementation

procedure TTurricanISO639_Tests.Setup;
begin
  fturricansIso639Service := GlobalContainer.Resolve<IISO639_1_Locator_Service>('Turrican');
end;

procedure TTurricanISO639_Tests.TearDown;
begin
  fturricansIso639Service := nil;
end;

procedure TTurricanISO639_Tests.ShouldRaiseExceptionWhenIncorrectIsoCode;
begin
  Assert.WillRaiseWithMessage(
    procedure
    begin
      fturricansIso639Service.ISO639_1ToLangName('FKC');
    end
    ,TISO639_1_CodeNotFoundException, 'Unrecognized code : FKC');
end;

procedure TTurricanISO639_Tests.ShouldRaiseExceptionWhenIncorrectNameCode;
begin
  Assert.WillRaiseWithMessage(
    procedure
    begin
      fturricansIso639Service.LangName2ISO639_1('FakeName');
    end
    ,TISO639_1_NameNotFoundException, 'Unrecognized name : FakeName');
end;

procedure TTurricanISO639_Tests.ShouldServiceInstanced;
begin
  Assert.Implements<IISO639_1_Locator_Service>(fturricansIso639Service);
end;

procedure TTurricanISO639_Tests.ShouldReturnValidNames(const AValue1 : string; const AValue2 : string);
begin
  var name := fturricansIso639Service.ISO639_1ToLangName(AValue1);
  Assert.AreEqual(AValue2, name);
end;

procedure TTurricanISO639_Tests.ShouldReturnInvalidCodes(const AValue1, AValue2: string);
begin
  var code := fturricansIso639Service.LangName2ISO639_1(AValue1);
  Assert.AreNotEqual(AValue2, code);
end;

procedure TTurricanISO639_Tests.ShouldReturnInvalidNames(const AValue1, AValue2: string);
begin
  var name := fturricansIso639Service.ISO639_1ToLangName(AValue1);
  Assert.AreNotEqual(AValue2, name);
end;

procedure TTurricanISO639_Tests.ShouldReturnValidCodes(const AValue1, AValue2: string);
begin
  var code := fturricansIso639Service.LangName2ISO639_1(AValue1);
  Assert.AreEqual(AValue2, code);
end;

initialization
  TDUnitX.RegisterTestFixture(TTurricanISO639_Tests);

end.
