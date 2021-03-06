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
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.Security.Authorization.AppCapabilityAccess is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AppCapabilityAccessStatus is (
      DeniedBySystem,
      NotDeclaredByApp,
      DeniedByUser,
      UserPromptRequired,
      Allowed
   );
   for AppCapabilityAccessStatus use (
      DeniedBySystem => 0,
      NotDeclaredByApp => 1,
      DeniedByUser => 2,
      UserPromptRequired => 3,
      Allowed => 4
   );
   for AppCapabilityAccessStatus'Size use 32;
   
   type AppCapabilityAccessStatus_Ptr is access AppCapabilityAccessStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_AppCapabilityAccessStatus_Interface;
   type AsyncOperationCompletedHandler_AppCapabilityAccessStatus is access all AsyncOperationCompletedHandler_AppCapabilityAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_AppCapabilityAccessStatus_Ptr is access all AsyncOperationCompletedHandler_AppCapabilityAccessStatus;
   type TypedEventHandler_IAppCapability_add_AccessChanged_Interface;
   type TypedEventHandler_IAppCapability_add_AccessChanged is access all TypedEventHandler_IAppCapability_add_AccessChanged_Interface'Class;
   type TypedEventHandler_IAppCapability_add_AccessChanged_Ptr is access all TypedEventHandler_IAppCapability_add_AccessChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAppCapability_Interface;
   type IAppCapability is access all IAppCapability_Interface'Class;
   type IAppCapability_Ptr is access all IAppCapability;
   type IAppCapabilityAccessChangedEventArgs_Interface;
   type IAppCapabilityAccessChangedEventArgs is access all IAppCapabilityAccessChangedEventArgs_Interface'Class;
   type IAppCapabilityAccessChangedEventArgs_Ptr is access all IAppCapabilityAccessChangedEventArgs;
   type IAppCapabilityStatics_Interface;
   type IAppCapabilityStatics is access all IAppCapabilityStatics_Interface'Class;
   type IAppCapabilityStatics_Ptr is access all IAppCapabilityStatics;
   type IAsyncOperation_AppCapabilityAccessStatus_Interface;
   type IAsyncOperation_AppCapabilityAccessStatus is access all IAsyncOperation_AppCapabilityAccessStatus_Interface'Class;
   type IAsyncOperation_AppCapabilityAccessStatus_Ptr is access all IAsyncOperation_AppCapabilityAccessStatus;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAppCapability : aliased constant Windows.IID := (1279908117, 35370, 17045, (148, 55, 45, 247, 195, 150, 175, 244 ));
   
   type IAppCapability_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CapabilityName
   (
      This       : access IAppCapability_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IAppCapability_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IAppCapability_Interface
      ; RetVal : access Windows.Security.Authorization.AppCapabilityAccess.IAsyncOperation_AppCapabilityAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CheckAccess
   (
      This       : access IAppCapability_Interface
      ; RetVal : access Windows.Security.Authorization.AppCapabilityAccess.AppCapabilityAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_AccessChanged
   (
      This       : access IAppCapability_Interface
      ; handler : TypedEventHandler_IAppCapability_add_AccessChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccessChanged
   (
      This       : access IAppCapability_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppCapabilityAccessChangedEventArgs : aliased constant Windows.IID := (173509909, 48599, 17790, (140, 202, 111, 83, 189, 46, 89, 68 ));
   
   type IAppCapabilityAccessChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAppCapabilityStatics : aliased constant Windows.IID := (2083864106, 18158, 17637, (175, 61, 106, 211, 252, 73, 189, 34 ));
   
   type IAppCapabilityStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAccessForCapabilitiesAsync
   (
      This       : access IAppCapabilityStatics_Interface
      ; capabilityNames : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessForCapabilitiesForUserAsync
   (
      This       : access IAppCapabilityStatics_Interface
      ; user : Windows.System.IUser
      ; capabilityNames : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Create
   (
      This       : access IAppCapabilityStatics_Interface
      ; capabilityName : Windows.String
      ; RetVal : access Windows.Security.Authorization.AppCapabilityAccess.IAppCapability
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithProcessIdForUser
   (
      This       : access IAppCapabilityStatics_Interface
      ; user : Windows.System.IUser
      ; capabilityName : Windows.String
      ; pid : Windows.UInt32
      ; RetVal : access Windows.Security.Authorization.AppCapabilityAccess.IAppCapability
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_AppCapabilityAccessStatus : aliased constant Windows.IID := (2189209410, 24550, 23387, (132, 206, 196, 72, 52, 19, 77, 61 ));
   
   type IAsyncOperation_AppCapabilityAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_AppCapabilityAccessStatus_Interface
      ; handler : Windows.Security.Authorization.AppCapabilityAccess.AsyncOperationCompletedHandler_AppCapabilityAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_AppCapabilityAccessStatus_Interface
      ; RetVal : access Windows.Security.Authorization.AppCapabilityAccess.AsyncOperationCompletedHandler_AppCapabilityAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_AppCapabilityAccessStatus_Interface
      ; RetVal : access Windows.Security.Authorization.AppCapabilityAccess.AppCapabilityAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_AppCapabilityAccessStatus : aliased constant Windows.IID := (1856041705, 48279, 22760, (163, 166, 200, 41, 185, 229, 242, 170 ));
   
   type AsyncOperationCompletedHandler_AppCapabilityAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authorization.AppCapabilityAccess.IAsyncOperation_AppCapabilityAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_AppCapabilityAccessStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_AppCapabilityAccessStatus_Interface
      ; asyncInfo : Windows.Security.Authorization.AppCapabilityAccess.IAsyncOperation_AppCapabilityAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppCapability_add_AccessChanged : aliased constant Windows.IID := (1838300309, 31619, 24409, (136, 131, 244, 65, 117, 40, 72, 152 ));
   
   type TypedEventHandler_IAppCapability_add_AccessChanged_Interface(Callback : access procedure (sender : Windows.Security.Authorization.AppCapabilityAccess.IAppCapability ; args : Windows.Security.Authorization.AppCapabilityAccess.IAppCapabilityAccessChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppCapability_add_AccessChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppCapability_add_AccessChanged_Interface
      ; sender : Windows.Security.Authorization.AppCapabilityAccess.IAppCapability
      ; args : Windows.Security.Authorization.AppCapabilityAccess.IAppCapabilityAccessChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AppCapability is Windows.Security.Authorization.AppCapabilityAccess.IAppCapability;
   subtype AppCapabilityAccessChangedEventArgs is Windows.Security.Authorization.AppCapabilityAccess.IAppCapabilityAccessChangedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function Create
   (
      capabilityName : Windows.String
   )
   return Windows.Security.Authorization.AppCapabilityAccess.IAppCapability;
   
   function CreateWithProcessIdForUser
   (
      user : Windows.System.IUser
      ; capabilityName : Windows.String
      ; pid : Windows.UInt32
   )
   return Windows.Security.Authorization.AppCapabilityAccess.IAppCapability;
   
   function RequestAccessForCapabilitiesAsync
   (
      capabilityNames : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Address;
   
   function RequestAccessForCapabilitiesForUserAsync
   (
      user : Windows.System.IUser
      ; capabilityNames : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Address;
   
end;
