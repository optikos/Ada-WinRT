--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Graphics.Display is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AdvancedColorKind is (
      StandardDynamicRange,
      WideColorGamut,
      HighDynamicRange
   );
   for AdvancedColorKind use (
      StandardDynamicRange => 0,
      WideColorGamut => 1,
      HighDynamicRange => 2
   );
   for AdvancedColorKind'Size use 32;
   
   type AdvancedColorKind_Ptr is access AdvancedColorKind;
   
   type HdrMetadataFormat is (
      Hdr10,
      Hdr10Plus
   );
   for HdrMetadataFormat use (
      Hdr10 => 0,
      Hdr10Plus => 1
   );
   for HdrMetadataFormat'Size use 32;
   
   type HdrMetadataFormat_Ptr is access HdrMetadataFormat;
   
   type DisplayOrientations is (
      None,
      Landscape,
      Portrait,
      LandscapeFlipped,
      PortraitFlipped
   );
   for DisplayOrientations use (
      None => 0,
      Landscape => 1,
      Portrait => 2,
      LandscapeFlipped => 4,
      PortraitFlipped => 8
   );
   for DisplayOrientations'Size use 32;
   
   type DisplayOrientations_Ptr is access DisplayOrientations;
   
   type ResolutionScale is (
      Invalid,
      Scale100Percent,
      Scale120Percent,
      Scale125Percent,
      Scale140Percent,
      Scale150Percent,
      Scale160Percent,
      Scale175Percent,
      Scale180Percent,
      Scale200Percent,
      Scale225Percent,
      Scale250Percent,
      Scale300Percent,
      Scale350Percent,
      Scale400Percent,
      Scale450Percent,
      Scale500Percent
   );
   for ResolutionScale use (
      Invalid => 0,
      Scale100Percent => 100,
      Scale120Percent => 120,
      Scale125Percent => 125,
      Scale140Percent => 140,
      Scale150Percent => 150,
      Scale160Percent => 160,
      Scale175Percent => 175,
      Scale180Percent => 180,
      Scale200Percent => 200,
      Scale225Percent => 225,
      Scale250Percent => 250,
      Scale300Percent => 300,
      Scale350Percent => 350,
      Scale400Percent => 400,
      Scale450Percent => 450,
      Scale500Percent => 500
   );
   for ResolutionScale'Size use 32;
   
   type ResolutionScale_Ptr is access ResolutionScale;
   
   type DisplayBrightnessScenario is (
      DefaultBrightness,
      IdleBrightness,
      BarcodeReadingBrightness,
      FullBrightness
   );
   for DisplayBrightnessScenario use (
      DefaultBrightness => 0,
      IdleBrightness => 1,
      BarcodeReadingBrightness => 2,
      FullBrightness => 3
   );
   for DisplayBrightnessScenario'Size use 32;
   
   type DisplayBrightnessScenario_Ptr is access DisplayBrightnessScenario;
   
   type DisplayBrightnessOverrideOptions is (
      None,
      UseDimmedPolicyWhenBatteryIsLow
   );
   for DisplayBrightnessOverrideOptions use (
      None => 0,
      UseDimmedPolicyWhenBatteryIsLow => 1
   );
   for DisplayBrightnessOverrideOptions'Size use 32;
   
   type DisplayBrightnessOverrideOptions_Ptr is access DisplayBrightnessOverrideOptions;
   
   type DisplayColorOverrideScenario is (
      Accurate
   );
   for DisplayColorOverrideScenario use (
      Accurate => 0
   );
   for DisplayColorOverrideScenario'Size use 32;
   
   type DisplayColorOverrideScenario_Ptr is access DisplayColorOverrideScenario;
   
   type DisplayBrightnessOverrideScenario is (
      IdleBrightness,
      BarcodeReadingBrightness,
      FullBrightness
   );
   for DisplayBrightnessOverrideScenario use (
      IdleBrightness => 0,
      BarcodeReadingBrightness => 1,
      FullBrightness => 2
   );
   for DisplayBrightnessOverrideScenario'Size use 32;
   
   type DisplayBrightnessOverrideScenario_Ptr is access DisplayBrightnessOverrideScenario;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type NitRange is record
      MinNits : Windows.Single;
      MaxNits : Windows.Single;
      StepSizeNits : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , NitRange);
   
   type NitRange_Ptr is access NitRange;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type DisplayPropertiesEventHandler_Interface;
   type DisplayPropertiesEventHandler is access all DisplayPropertiesEventHandler_Interface'Class;
   type DisplayPropertiesEventHandler_Ptr is access all DisplayPropertiesEventHandler;
   type TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated_Interface;
   type TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated is access all TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated_Interface'Class;
   type TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated_Ptr is access all TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated;
   type TypedEventHandler_IDisplayInformation_add_OrientationChanged_Interface;
   type TypedEventHandler_IDisplayInformation_add_OrientationChanged is access all TypedEventHandler_IDisplayInformation_add_OrientationChanged_Interface'Class;
   type TypedEventHandler_IDisplayInformation_add_OrientationChanged_Ptr is access all TypedEventHandler_IDisplayInformation_add_OrientationChanged;
   type TypedEventHandler_IDisplayInformation_add_DpiChanged_Interface;
   type TypedEventHandler_IDisplayInformation_add_DpiChanged is access all TypedEventHandler_IDisplayInformation_add_DpiChanged_Interface'Class;
   type TypedEventHandler_IDisplayInformation_add_DpiChanged_Ptr is access all TypedEventHandler_IDisplayInformation_add_DpiChanged;
   type TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged_Interface;
   type TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged is access all TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged_Interface'Class;
   type TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged_Ptr is access all TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged;
   type TypedEventHandler_IDisplayInformation_add_ColorProfileChanged_Interface;
   type TypedEventHandler_IDisplayInformation_add_ColorProfileChanged is access all TypedEventHandler_IDisplayInformation_add_ColorProfileChanged_Interface'Class;
   type TypedEventHandler_IDisplayInformation_add_ColorProfileChanged_Ptr is access all TypedEventHandler_IDisplayInformation_add_ColorProfileChanged;
   type TypedEventHandler_IDisplayInformation5_add_AdvancedColorInfoChanged_Interface;
   type TypedEventHandler_IDisplayInformation5_add_AdvancedColorInfoChanged is access all TypedEventHandler_IDisplayInformation5_add_AdvancedColorInfoChanged_Interface'Class;
   type TypedEventHandler_IDisplayInformation5_add_AdvancedColorInfoChanged_Ptr is access all TypedEventHandler_IDisplayInformation5_add_AdvancedColorInfoChanged;
   type TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged_Interface;
   type TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged is access all TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged_Interface'Class;
   type TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged_Ptr is access all TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged;
   type TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged_Interface;
   type TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged is access all TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged_Interface'Class;
   type TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged_Ptr is access all TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged;
   type TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged_Interface;
   type TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged is access all TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged_Interface'Class;
   type TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged_Ptr is access all TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged;
   type TypedEventHandler_IDisplayEnhancementOverride_add_CanOverrideChanged_Interface;
   type TypedEventHandler_IDisplayEnhancementOverride_add_CanOverrideChanged is access all TypedEventHandler_IDisplayEnhancementOverride_add_CanOverrideChanged_Interface'Class;
   type TypedEventHandler_IDisplayEnhancementOverride_add_CanOverrideChanged_Ptr is access all TypedEventHandler_IDisplayEnhancementOverride_add_CanOverrideChanged;
   type TypedEventHandler_IDisplayEnhancementOverride_add_IsOverrideActiveChanged_Interface;
   type TypedEventHandler_IDisplayEnhancementOverride_add_IsOverrideActiveChanged is access all TypedEventHandler_IDisplayEnhancementOverride_add_IsOverrideActiveChanged_Interface'Class;
   type TypedEventHandler_IDisplayEnhancementOverride_add_IsOverrideActiveChanged_Ptr is access all TypedEventHandler_IDisplayEnhancementOverride_add_IsOverrideActiveChanged;
   type TypedEventHandler_IDisplayEnhancementOverride_add_DisplayEnhancementOverrideCapabilitiesChanged_Interface;
   type TypedEventHandler_IDisplayEnhancementOverride_add_DisplayEnhancementOverrideCapabilitiesChanged is access all TypedEventHandler_IDisplayEnhancementOverride_add_DisplayEnhancementOverrideCapabilitiesChanged_Interface'Class;
   type TypedEventHandler_IDisplayEnhancementOverride_add_DisplayEnhancementOverrideCapabilitiesChanged_Ptr is access all TypedEventHandler_IDisplayEnhancementOverride_add_DisplayEnhancementOverrideCapabilitiesChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDisplayInformationStatics_Interface;
   type IDisplayInformationStatics is access all IDisplayInformationStatics_Interface'Class;
   type IDisplayInformationStatics_Ptr is access all IDisplayInformationStatics;
   type IDisplayInformation_Interface;
   type IDisplayInformation is access all IDisplayInformation_Interface'Class;
   type IDisplayInformation_Ptr is access all IDisplayInformation;
   type IDisplayInformation2_Interface;
   type IDisplayInformation2 is access all IDisplayInformation2_Interface'Class;
   type IDisplayInformation2_Ptr is access all IDisplayInformation2;
   type IDisplayInformation3_Interface;
   type IDisplayInformation3 is access all IDisplayInformation3_Interface'Class;
   type IDisplayInformation3_Ptr is access all IDisplayInformation3;
   type IDisplayInformation4_Interface;
   type IDisplayInformation4 is access all IDisplayInformation4_Interface'Class;
   type IDisplayInformation4_Ptr is access all IDisplayInformation4;
   type IAdvancedColorInfo_Interface;
   type IAdvancedColorInfo is access all IAdvancedColorInfo_Interface'Class;
   type IAdvancedColorInfo_Ptr is access all IAdvancedColorInfo;
   type IDisplayInformation5_Interface;
   type IDisplayInformation5 is access all IDisplayInformation5_Interface'Class;
   type IDisplayInformation5_Ptr is access all IDisplayInformation5;
   type IDisplayPropertiesStatics_Interface;
   type IDisplayPropertiesStatics is access all IDisplayPropertiesStatics_Interface'Class;
   type IDisplayPropertiesStatics_Ptr is access all IDisplayPropertiesStatics;
   type IBrightnessOverrideStatics_Interface;
   type IBrightnessOverrideStatics is access all IBrightnessOverrideStatics_Interface'Class;
   type IBrightnessOverrideStatics_Ptr is access all IBrightnessOverrideStatics;
   type IBrightnessOverride_Interface;
   type IBrightnessOverride is access all IBrightnessOverride_Interface'Class;
   type IBrightnessOverride_Ptr is access all IBrightnessOverride;
   type IBrightnessOverrideSettingsStatics_Interface;
   type IBrightnessOverrideSettingsStatics is access all IBrightnessOverrideSettingsStatics_Interface'Class;
   type IBrightnessOverrideSettingsStatics_Ptr is access all IBrightnessOverrideSettingsStatics;
   type IBrightnessOverrideSettings_Interface;
   type IBrightnessOverrideSettings is access all IBrightnessOverrideSettings_Interface'Class;
   type IBrightnessOverrideSettings_Ptr is access all IBrightnessOverrideSettings;
   type IColorOverrideSettingsStatics_Interface;
   type IColorOverrideSettingsStatics is access all IColorOverrideSettingsStatics_Interface'Class;
   type IColorOverrideSettingsStatics_Ptr is access all IColorOverrideSettingsStatics;
   type IColorOverrideSettings_Interface;
   type IColorOverrideSettings is access all IColorOverrideSettings_Interface'Class;
   type IColorOverrideSettings_Ptr is access all IColorOverrideSettings;
   type IDisplayEnhancementOverrideCapabilitiesChangedEventArgs_Interface;
   type IDisplayEnhancementOverrideCapabilitiesChangedEventArgs is access all IDisplayEnhancementOverrideCapabilitiesChangedEventArgs_Interface'Class;
   type IDisplayEnhancementOverrideCapabilitiesChangedEventArgs_Ptr is access all IDisplayEnhancementOverrideCapabilitiesChangedEventArgs;
   type IDisplayEnhancementOverrideCapabilities_Interface;
   type IDisplayEnhancementOverrideCapabilities is access all IDisplayEnhancementOverrideCapabilities_Interface'Class;
   type IDisplayEnhancementOverrideCapabilities_Ptr is access all IDisplayEnhancementOverrideCapabilities;
   type IDisplayEnhancementOverrideStatics_Interface;
   type IDisplayEnhancementOverrideStatics is access all IDisplayEnhancementOverrideStatics_Interface'Class;
   type IDisplayEnhancementOverrideStatics_Ptr is access all IDisplayEnhancementOverrideStatics;
   type IDisplayEnhancementOverride_Interface;
   type IDisplayEnhancementOverride is access all IDisplayEnhancementOverride_Interface'Class;
   type IDisplayEnhancementOverride_Ptr is access all IDisplayEnhancementOverride;
   type IIterator_NitRange_Interface;
   type IIterator_NitRange is access all IIterator_NitRange_Interface'Class;
   type IIterator_NitRange_Ptr is access all IIterator_NitRange;
   type IIterable_NitRange_Interface;
   type IIterable_NitRange is access all IIterable_NitRange_Interface'Class;
   type IIterable_NitRange_Ptr is access all IIterable_NitRange;
   type IVectorView_NitRange_Interface;
   type IVectorView_NitRange is access all IVectorView_NitRange_Interface'Class;
   type IVectorView_NitRange_Ptr is access all IVectorView_NitRange;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDisplayInformationStatics : aliased constant Windows.IID := (3332385388, 54354, 17628, (186, 7, 150, 243, 198, 173, 249, 209 ));
   
   type IDisplayInformationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IDisplayInformationStatics_Interface
      ; RetVal : access Windows.Graphics.Display.IDisplayInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoRotationPreferences
   (
      This       : access IDisplayInformationStatics_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoRotationPreferences
   (
      This       : access IDisplayInformationStatics_Interface
      ; value : Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function add_DisplayContentsInvalidated
   (
      This       : access IDisplayInformationStatics_Interface
      ; handler : TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DisplayContentsInvalidated
   (
      This       : access IDisplayInformationStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayInformation : aliased constant Windows.IID := (3201372846, 44483, 19913, (174, 101, 133, 31, 77, 125, 71, 153 ));
   
   type IDisplayInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentOrientation
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_NativeOrientation
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function add_OrientationChanged
   (
      This       : access IDisplayInformation_Interface
      ; handler : TypedEventHandler_IDisplayInformation_add_OrientationChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OrientationChanged
   (
      This       : access IDisplayInformation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolutionScale
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Graphics.Display.ResolutionScale
   )
   return Windows.HRESULT is abstract;
   
   function get_LogicalDpi
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RawDpiX
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RawDpiY
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function add_DpiChanged
   (
      This       : access IDisplayInformation_Interface
      ; handler : TypedEventHandler_IDisplayInformation_add_DpiChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DpiChanged
   (
      This       : access IDisplayInformation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_StereoEnabled
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_StereoEnabledChanged
   (
      This       : access IDisplayInformation_Interface
      ; handler : TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StereoEnabledChanged
   (
      This       : access IDisplayInformation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetColorProfileAsync
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ColorProfileChanged
   (
      This       : access IDisplayInformation_Interface
      ; handler : TypedEventHandler_IDisplayInformation_add_ColorProfileChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ColorProfileChanged
   (
      This       : access IDisplayInformation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayInformation2 : aliased constant Windows.IID := (1305280545, 64209, 19342, (142, 223, 119, 88, 135, 184, 191, 25 ));
   
   type IDisplayInformation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RawPixelsPerViewPixel
   (
      This       : access IDisplayInformation2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayInformation3 : aliased constant Windows.IID := (3675586845, 3849, 17510, (143, 243, 17, 222, 154, 60, 146, 154 ));
   
   type IDisplayInformation3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DiagonalSizeInInches
   (
      This       : access IDisplayInformation3_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayInformation4 : aliased constant Windows.IID := (3379744303, 4674, 18110, (181, 54, 225, 170, 254, 158, 122, 207 ));
   
   type IDisplayInformation4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ScreenWidthInRawPixels
   (
      This       : access IDisplayInformation4_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ScreenHeightInRawPixels
   (
      This       : access IDisplayInformation4_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAdvancedColorInfo : aliased constant Windows.IID := (2274876667, 45609, 16513, (174, 154, 44, 200, 94, 52, 173, 106 ));
   
   type IAdvancedColorInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentAdvancedColorKind
   (
      This       : access IAdvancedColorInfo_Interface
      ; RetVal : access Windows.Graphics.Display.AdvancedColorKind
   )
   return Windows.HRESULT is abstract;
   
   function get_RedPrimary
   (
      This       : access IAdvancedColorInfo_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_GreenPrimary
   (
      This       : access IAdvancedColorInfo_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_BluePrimary
   (
      This       : access IAdvancedColorInfo_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_WhitePoint
   (
      This       : access IAdvancedColorInfo_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxLuminanceInNits
   (
      This       : access IAdvancedColorInfo_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_MinLuminanceInNits
   (
      This       : access IAdvancedColorInfo_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxAverageFullFrameLuminanceInNits
   (
      This       : access IAdvancedColorInfo_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_SdrWhiteLevelInNits
   (
      This       : access IAdvancedColorInfo_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function IsHdrMetadataFormatCurrentlySupported
   (
      This       : access IAdvancedColorInfo_Interface
      ; format : Windows.Graphics.Display.HdrMetadataFormat
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsAdvancedColorKindAvailable
   (
      This       : access IAdvancedColorInfo_Interface
      ; kind : Windows.Graphics.Display.AdvancedColorKind
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayInformation5 : aliased constant Windows.IID := (978600668, 11486, 19085, (128, 209, 33, 220, 90, 220, 193, 170 ));
   
   type IDisplayInformation5_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAdvancedColorInfo
   (
      This       : access IDisplayInformation5_Interface
      ; RetVal : access Windows.Graphics.Display.IAdvancedColorInfo
   )
   return Windows.HRESULT is abstract;
   
   function add_AdvancedColorInfoChanged
   (
      This       : access IDisplayInformation5_Interface
      ; handler : TypedEventHandler_IDisplayInformation5_add_AdvancedColorInfoChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AdvancedColorInfoChanged
   (
      This       : access IDisplayInformation5_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayPropertiesStatics : aliased constant Windows.IID := (1765272973, 12522, 19949, (130, 113, 69, 83, 255, 2, 246, 138 ));
   
   type IDisplayPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentOrientation
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_NativeOrientation
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoRotationPreferences
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoRotationPreferences
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; value : Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function add_OrientationChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OrientationChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolutionScale
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Graphics.Display.ResolutionScale
   )
   return Windows.HRESULT is abstract;
   
   function get_LogicalDpi
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function add_LogicalDpiChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LogicalDpiChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_StereoEnabled
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_StereoEnabledChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StereoEnabledChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetColorProfileAsync
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ColorProfileChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ColorProfileChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DisplayContentsInvalidated
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DisplayContentsInvalidated
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBrightnessOverrideStatics : aliased constant Windows.IID := (61323757, 57841, 19048, (161, 31, 148, 106, 216, 206, 83, 147 ));
   
   type IBrightnessOverrideStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultForSystem
   (
      This       : access IBrightnessOverrideStatics_Interface
      ; RetVal : access Windows.Graphics.Display.IBrightnessOverride
   )
   return Windows.HRESULT is abstract;
   
   function GetForCurrentView
   (
      This       : access IBrightnessOverrideStatics_Interface
      ; RetVal : access Windows.Graphics.Display.IBrightnessOverride
   )
   return Windows.HRESULT is abstract;
   
   function SaveForSystemAsync
   (
      This       : access IBrightnessOverrideStatics_Interface
      ; value : Windows.Graphics.Display.IBrightnessOverride
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBrightnessOverride : aliased constant Windows.IID := (2529780250, 49475, 17298, (190, 221, 74, 126, 149, 116, 200, 253 ));
   
   type IBrightnessOverride_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSupported
   (
      This       : access IBrightnessOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOverrideActive
   (
      This       : access IBrightnessOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_BrightnessLevel
   (
      This       : access IBrightnessOverride_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SetBrightnessLevel
   (
      This       : access IBrightnessOverride_Interface
      ; brightnessLevel : Windows.Double
      ; options : Windows.Graphics.Display.DisplayBrightnessOverrideOptions
   )
   return Windows.HRESULT is abstract;
   
   function SetBrightnessScenario
   (
      This       : access IBrightnessOverride_Interface
      ; scenario : Windows.Graphics.Display.DisplayBrightnessScenario
      ; options : Windows.Graphics.Display.DisplayBrightnessOverrideOptions
   )
   return Windows.HRESULT is abstract;
   
   function GetLevelForScenario
   (
      This       : access IBrightnessOverride_Interface
      ; scenario : Windows.Graphics.Display.DisplayBrightnessScenario
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function StartOverride
   (
      This       : access IBrightnessOverride_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StopOverride
   (
      This       : access IBrightnessOverride_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_IsSupportedChanged
   (
      This       : access IBrightnessOverride_Interface
      ; handler : TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsSupportedChanged
   (
      This       : access IBrightnessOverride_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_IsOverrideActiveChanged
   (
      This       : access IBrightnessOverride_Interface
      ; handler : TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsOverrideActiveChanged
   (
      This       : access IBrightnessOverride_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BrightnessLevelChanged
   (
      This       : access IBrightnessOverride_Interface
      ; handler : TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BrightnessLevelChanged
   (
      This       : access IBrightnessOverride_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBrightnessOverrideSettingsStatics : aliased constant Windows.IID := (3565673616, 28532, 17419, (179, 131, 95, 233, 108, 240, 11, 15 ));
   
   type IBrightnessOverrideSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromLevel
   (
      This       : access IBrightnessOverrideSettingsStatics_Interface
      ; level : Windows.Double
      ; RetVal : access Windows.Graphics.Display.IBrightnessOverrideSettings
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromNits
   (
      This       : access IBrightnessOverrideSettingsStatics_Interface
      ; nits : Windows.Single
      ; RetVal : access Windows.Graphics.Display.IBrightnessOverrideSettings
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromDisplayBrightnessOverrideScenario
   (
      This       : access IBrightnessOverrideSettingsStatics_Interface
      ; overrideScenario : Windows.Graphics.Display.DisplayBrightnessOverrideScenario
      ; RetVal : access Windows.Graphics.Display.IBrightnessOverrideSettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBrightnessOverrideSettings : aliased constant Windows.IID := (3507661610, 30212, 19898, (188, 248, 75, 111, 73, 80, 44, 176 ));
   
   type IBrightnessOverrideSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredLevel
   (
      This       : access IBrightnessOverrideSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredNits
   (
      This       : access IBrightnessOverrideSettings_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IColorOverrideSettingsStatics : aliased constant Windows.IID := (2959663199, 50207, 19145, (175, 171, 130, 122, 182, 36, 143, 154 ));
   
   type IColorOverrideSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromDisplayColorOverrideScenario
   (
      This       : access IColorOverrideSettingsStatics_Interface
      ; overrideScenario : Windows.Graphics.Display.DisplayColorOverrideScenario
      ; RetVal : access Windows.Graphics.Display.IColorOverrideSettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IColorOverrideSettings : aliased constant Windows.IID := (4226785588, 19073, 19533, (165, 182, 125, 27, 92, 75, 208, 11 ));
   
   type IColorOverrideSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredDisplayColorOverrideScenario
   (
      This       : access IColorOverrideSettings_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayColorOverrideScenario
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayEnhancementOverrideCapabilitiesChangedEventArgs : aliased constant Windows.IID := (3680626276, 5626, 18906, (139, 119, 7, 219, 210, 175, 88, 93 ));
   
   type IDisplayEnhancementOverrideCapabilitiesChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Capabilities
   (
      This       : access IDisplayEnhancementOverrideCapabilitiesChangedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Display.IDisplayEnhancementOverrideCapabilities
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayEnhancementOverrideCapabilities : aliased constant Windows.IID := (1164992734, 61018, 18359, (153, 24, 30, 81, 232, 18, 204, 200 ));
   
   type IDisplayEnhancementOverrideCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsBrightnessControlSupported
   (
      This       : access IDisplayEnhancementOverrideCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBrightnessNitsControlSupported
   (
      This       : access IDisplayEnhancementOverrideCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetSupportedNitRanges
   (
      This       : access IDisplayEnhancementOverrideCapabilities_Interface
      ; RetVal : access Windows.Graphics.Display.IVectorView_NitRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayEnhancementOverrideStatics : aliased constant Windows.IID := (3478879937, 38801, 17491, (176, 19, 41, 182, 247, 120, 229, 25 ));
   
   type IDisplayEnhancementOverrideStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IDisplayEnhancementOverrideStatics_Interface
      ; RetVal : access Windows.Graphics.Display.IDisplayEnhancementOverride
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayEnhancementOverride : aliased constant Windows.IID := (1117099215, 55674, 19202, (164, 40, 92, 66, 146, 247, 245, 34 ));
   
   type IDisplayEnhancementOverride_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColorOverrideSettings
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; RetVal : access Windows.Graphics.Display.IColorOverrideSettings
   )
   return Windows.HRESULT is abstract;
   
   function put_ColorOverrideSettings
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; value : Windows.Graphics.Display.IColorOverrideSettings
   )
   return Windows.HRESULT is abstract;
   
   function get_BrightnessOverrideSettings
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; RetVal : access Windows.Graphics.Display.IBrightnessOverrideSettings
   )
   return Windows.HRESULT is abstract;
   
   function put_BrightnessOverrideSettings
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; value : Windows.Graphics.Display.IBrightnessOverrideSettings
   )
   return Windows.HRESULT is abstract;
   
   function get_CanOverride
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOverrideActive
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentDisplayEnhancementOverrideCapabilities
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; RetVal : access Windows.Graphics.Display.IDisplayEnhancementOverrideCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function RequestOverride
   (
      This       : access IDisplayEnhancementOverride_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StopOverride
   (
      This       : access IDisplayEnhancementOverride_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_CanOverrideChanged
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; handler : TypedEventHandler_IDisplayEnhancementOverride_add_CanOverrideChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CanOverrideChanged
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_IsOverrideActiveChanged
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; handler : TypedEventHandler_IDisplayEnhancementOverride_add_IsOverrideActiveChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsOverrideActiveChanged
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DisplayEnhancementOverrideCapabilitiesChanged
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; handler : TypedEventHandler_IDisplayEnhancementOverride_add_DisplayEnhancementOverrideCapabilitiesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DisplayEnhancementOverrideCapabilitiesChanged
   (
      This       : access IDisplayEnhancementOverride_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_NitRange : aliased constant Windows.IID := (1810442643, 53353, 23193, (185, 232, 32, 12, 245, 200, 160, 96 ));
   
   type IIterator_NitRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_NitRange_Interface
      ; RetVal : access Windows.Graphics.Display.NitRange
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_NitRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_NitRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_NitRange_Interface
      ; items : Windows.Graphics.Display.NitRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_NitRange : aliased constant Windows.IID := (2142742403, 52781, 21805, (190, 227, 188, 20, 66, 219, 4, 9 ));
   
   type IIterable_NitRange_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_NitRange_Interface
      ; RetVal : access Windows.Graphics.Display.IIterator_NitRange
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_NitRange : aliased constant Windows.IID := (3431920166, 20673, 24314, (152, 196, 16, 67, 208, 191, 91, 53 ));
   
   type IVectorView_NitRange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_NitRange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Display.NitRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_NitRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_NitRange_Interface
      ; value : Windows.Graphics.Display.NitRange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_NitRange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Display.NitRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_DisplayPropertiesEventHandler : aliased constant Windows.IID := (3688729345, 61857, 18129, (158, 227, 84, 59, 204, 153, 89, 128 ));
   
   type DisplayPropertiesEventHandler_Interface(Callback : access procedure (sender : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_DisplayPropertiesEventHandler'access) with null record;
   function Invoke
   (
      This       : access DisplayPropertiesEventHandler_Interface
      ; sender : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated : aliased constant Windows.IID := (2261055001, 26550, 20935, (179, 13, 216, 207, 19, 98, 83, 39 ));
   
   type TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayInformation_add_OrientationChanged : aliased constant Windows.IID := (2261055001, 26550, 20935, (179, 13, 216, 207, 19, 98, 83, 39 ));
   
   type TypedEventHandler_IDisplayInformation_add_OrientationChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayInformation_add_OrientationChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_OrientationChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayInformation_add_DpiChanged : aliased constant Windows.IID := (2261055001, 26550, 20935, (179, 13, 216, 207, 19, 98, 83, 39 ));
   
   type TypedEventHandler_IDisplayInformation_add_DpiChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayInformation_add_DpiChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_DpiChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged : aliased constant Windows.IID := (2261055001, 26550, 20935, (179, 13, 216, 207, 19, 98, 83, 39 ));
   
   type TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayInformation_add_ColorProfileChanged : aliased constant Windows.IID := (2261055001, 26550, 20935, (179, 13, 216, 207, 19, 98, 83, 39 ));
   
   type TypedEventHandler_IDisplayInformation_add_ColorProfileChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayInformation_add_ColorProfileChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_ColorProfileChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayInformation5_add_AdvancedColorInfoChanged : aliased constant Windows.IID := (2261055001, 26550, 20935, (179, 13, 216, 207, 19, 98, 83, 39 ));
   
   type TypedEventHandler_IDisplayInformation5_add_AdvancedColorInfoChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayInformation5_add_AdvancedColorInfoChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation5_add_AdvancedColorInfoChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged : aliased constant Windows.IID := (2757763406, 26144, 21021, (156, 185, 160, 160, 247, 50, 206, 144 ));
   
   type TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IBrightnessOverride ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged_Interface
      ; sender : Windows.Graphics.Display.IBrightnessOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged : aliased constant Windows.IID := (2757763406, 26144, 21021, (156, 185, 160, 160, 247, 50, 206, 144 ));
   
   type TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IBrightnessOverride ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged_Interface
      ; sender : Windows.Graphics.Display.IBrightnessOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged : aliased constant Windows.IID := (2757763406, 26144, 21021, (156, 185, 160, 160, 247, 50, 206, 144 ));
   
   type TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IBrightnessOverride ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged_Interface
      ; sender : Windows.Graphics.Display.IBrightnessOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayEnhancementOverride_add_CanOverrideChanged : aliased constant Windows.IID := (843560267, 32512, 21845, (129, 223, 175, 174, 2, 47, 7, 150 ));
   
   type TypedEventHandler_IDisplayEnhancementOverride_add_CanOverrideChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayEnhancementOverride ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayEnhancementOverride_add_CanOverrideChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayEnhancementOverride_add_CanOverrideChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayEnhancementOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayEnhancementOverride_add_IsOverrideActiveChanged : aliased constant Windows.IID := (843560267, 32512, 21845, (129, 223, 175, 174, 2, 47, 7, 150 ));
   
   type TypedEventHandler_IDisplayEnhancementOverride_add_IsOverrideActiveChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayEnhancementOverride ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayEnhancementOverride_add_IsOverrideActiveChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayEnhancementOverride_add_IsOverrideActiveChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayEnhancementOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayEnhancementOverride_add_DisplayEnhancementOverrideCapabilitiesChanged : aliased constant Windows.IID := (2120331028, 15913, 20537, (146, 238, 63, 36, 114, 185, 158, 67 ));
   
   type TypedEventHandler_IDisplayEnhancementOverride_add_DisplayEnhancementOverrideCapabilitiesChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayEnhancementOverride ; args : Windows.Graphics.Display.IDisplayEnhancementOverrideCapabilitiesChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayEnhancementOverride_add_DisplayEnhancementOverrideCapabilitiesChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayEnhancementOverride_add_DisplayEnhancementOverrideCapabilitiesChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayEnhancementOverride
      ; args : Windows.Graphics.Display.IDisplayEnhancementOverrideCapabilitiesChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DisplayInformation is Windows.Graphics.Display.IDisplayInformation;
   subtype AdvancedColorInfo is Windows.Graphics.Display.IAdvancedColorInfo;
   subtype BrightnessOverride is Windows.Graphics.Display.IBrightnessOverride;
   subtype BrightnessOverrideSettings is Windows.Graphics.Display.IBrightnessOverrideSettings;
   subtype ColorOverrideSettings is Windows.Graphics.Display.IColorOverrideSettings;
   subtype DisplayEnhancementOverrideCapabilities is Windows.Graphics.Display.IDisplayEnhancementOverrideCapabilities;
   subtype DisplayEnhancementOverrideCapabilitiesChangedEventArgs is Windows.Graphics.Display.IDisplayEnhancementOverrideCapabilitiesChangedEventArgs;
   subtype DisplayEnhancementOverride is Windows.Graphics.Display.IDisplayEnhancementOverride;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.Graphics.Display.IDisplayInformation;
   
   function get_AutoRotationPreferences
   return Windows.Graphics.Display.DisplayOrientations;
   
   procedure put_AutoRotationPreferences
   (
      value : Windows.Graphics.Display.DisplayOrientations
   )
   ;
   
   function add_DisplayContentsInvalidated
   (
      handler : TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_DisplayContentsInvalidated
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_CurrentOrientation
   return Windows.Graphics.Display.DisplayOrientations;
   
   function get_NativeOrientation
   return Windows.Graphics.Display.DisplayOrientations;
   
   function get_AutoRotationPreferences_DisplayProperties
   return Windows.Graphics.Display.DisplayOrientations;
   
   procedure put_AutoRotationPreferences_DisplayProperties
   (
      value : Windows.Graphics.Display.DisplayOrientations
   )
   ;
   
   function add_OrientationChanged
   (
      handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_OrientationChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_ResolutionScale
   return Windows.Graphics.Display.ResolutionScale;
   
   function get_LogicalDpi
   return Windows.Single;
   
   function add_LogicalDpiChanged
   (
      handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_LogicalDpiChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_StereoEnabled
   return Windows.Boolean;
   
   function add_StereoEnabledChanged
   (
      handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_StereoEnabledChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function GetColorProfileAsync
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream;
   
   function add_ColorProfileChanged
   (
      handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_ColorProfileChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_DisplayContentsInvalidated
   (
      handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_DisplayContentsInvalidated_DisplayProperties
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function GetDefaultForSystem
   return Windows.Graphics.Display.IBrightnessOverride;
   
   function GetForCurrentView
   return Windows.Graphics.Display.IBrightnessOverride;
   
   function SaveForSystemAsync
   (
      value : Windows.Graphics.Display.IBrightnessOverride
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function CreateFromLevel
   (
      level : Windows.Double
   )
   return Windows.Graphics.Display.IBrightnessOverrideSettings;
   
   function CreateFromNits
   (
      nits : Windows.Single
   )
   return Windows.Graphics.Display.IBrightnessOverrideSettings;
   
   function CreateFromDisplayBrightnessOverrideScenario
   (
      overrideScenario : Windows.Graphics.Display.DisplayBrightnessOverrideScenario
   )
   return Windows.Graphics.Display.IBrightnessOverrideSettings;
   
   function CreateFromDisplayColorOverrideScenario
   (
      overrideScenario : Windows.Graphics.Display.DisplayColorOverrideScenario
   )
   return Windows.Graphics.Display.IColorOverrideSettings;
   
   function GetForCurrentView
   return Windows.Graphics.Display.IDisplayEnhancementOverride;
   
end;
