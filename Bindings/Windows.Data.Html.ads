--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.Data.Html is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IHtmlUtilities_Interface;
   type IHtmlUtilities is access all IHtmlUtilities_Interface'Class;
   type IHtmlUtilities_Ptr is access all IHtmlUtilities;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IHtmlUtilities_Interface is interface and Windows.IInspectable_Interface;
   
   function ConvertToText
   (
      This       : access IHtmlUtilities_Interface
      ; html : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IHtmlUtilities : aliased constant Windows.IID := (4273998557, 9113, 20396, (181, 167, 5, 233, 172, 215, 24, 29 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function ConvertToText
   (
      html : Windows.String
   )
   return Windows.String;

end;
