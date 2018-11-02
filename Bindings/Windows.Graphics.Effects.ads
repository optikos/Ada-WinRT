--------------------------------------------------------------------------------
-- <auto-generated>                                                           --
--     This code was generated by a tool.                                     --
--                                                                            --
--     Changes to this file may cause incorrect behavior and will be lost if  --
--     the code is regenerated.                                               --
-- </auto-generated>                                                          --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--                                                                            --
-- This program is free software: you can redistribute it and / or modify     --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
package Windows.Graphics.Effects is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGraphicsEffect_Interface;
   type IGraphicsEffect is access all IGraphicsEffect_Interface'Class;
   type IGraphicsEffect_Ptr is access all IGraphicsEffect;
   type IGraphicsEffectSource_Interface;
   type IGraphicsEffectSource is access all IGraphicsEffectSource_Interface'Class;
   type IGraphicsEffectSource_Ptr is access all IGraphicsEffectSource;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IGraphicsEffect : aliased constant Windows.IID := (3411132622, 36838, 17974, (178, 2, 134, 31, 170, 7, 216, 243 ));
   
   type IGraphicsEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IGraphicsEffect_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IGraphicsEffect_Interface
      ; name : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGraphicsEffectSource : aliased constant Windows.IID := (764386780, 17209, 20153, (146, 22, 249, 222, 183, 86, 88, 162 ));
   
   type IGraphicsEffectSource_Interface is interface and Windows.IInspectable_Interface;
   
end;
