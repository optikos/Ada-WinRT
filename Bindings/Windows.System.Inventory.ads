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
with Windows.Foundation;
with Windows.Foundation.Collections;
package Windows.System.Inventory is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IInstalledDesktopApp_Interface;
   type IInstalledDesktopApp is access all IInstalledDesktopApp_Interface'Class;
   type IInstalledDesktopApp_Ptr is access all IInstalledDesktopApp;
   type IInstalledDesktopAppStatics_Interface;
   type IInstalledDesktopAppStatics is access all IInstalledDesktopAppStatics_Interface'Class;
   type IInstalledDesktopAppStatics_Ptr is access all IInstalledDesktopAppStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IInstalledDesktopApp : aliased constant Windows.IID := (1978317037, 49340, 21348, (76, 40, 22, 110, 5, 69, 22, 122 ));
   
   type IInstalledDesktopApp_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IInstalledDesktopApp_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IInstalledDesktopApp_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Publisher
   (
      This       : access IInstalledDesktopApp_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayVersion
   (
      This       : access IInstalledDesktopApp_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInstalledDesktopAppStatics : aliased constant Windows.IID := (642578254, 8653, 24475, (96, 86, 120, 102, 173, 114, 72, 154 ));
   
   type IInstalledDesktopAppStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetInventoryAsync
   (
      This       : access IInstalledDesktopAppStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype InstalledDesktopApp is Windows.System.Inventory.IInstalledDesktopApp;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetInventoryAsync
   return Windows.Address;
   
end;
