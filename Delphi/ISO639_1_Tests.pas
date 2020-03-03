unit ISO639_1_Tests;

interface

uses

  DUnitX.TestFramework,
  ISO639_Exceptions,
  ISO639_1_Locator_Service;

type
  [TestFixture]
  TISO639_Tests = class(TObject)
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
    [Test]
    procedure Test1;
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('TestA','1,2')]
    [TestCase('TestB','3,4')]
    procedure Test2(const AValue1 : Integer;const AValue2 : Integer);
  end;

implementation

procedure TISO639_Tests.Setup;
begin

end;

procedure TISO639_Tests.TearDown;
begin
end;

procedure TISO639_Tests.Test1;
begin
end;

procedure TISO639_Tests.Test2(const AValue1 : Integer;const AValue2 : Integer);
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TISO639_Tests);

end.
