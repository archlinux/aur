-- This file is part of VulkAda.

-- VulkAda is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as
-- published by the Free Software Foundation, either version 3 of
-- the License, or (at your option) any later version.

-- VulkAda is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public
-- License along with VulkAda.
-- If not, see <http://www.gnu.org/licenses/>.

-- Copyright 2025 Phaser Cat Games LLC

-- C interface to the surface protected capabilities extension

with Vulkan.C,
     Vulkan.Extensions.KHR;

private package Vulkan.Extensions.KHR_Surface_Protected_Capabilities_C is
    -- Extension record identifiers.
    subtype Structure is Structure_Type
        with Static_Predicate => Structure in
            Surface_Protected_Capabilities_Type;

    -- C interface records.
    type Surface_Protected_Capabilities_C is
    record
        Record_Type: In_Structure_Type := Surface_Protected_Capabilities_Type;
        Next: C.In_Structure_C_Access;
        Supports_Protected: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Surface_Protected_Capabilities_C_Access is
        access Surface_Protected_Capabilities_C
        with Convention => C;

    -- Conversion subprograms.
    function To_C(Struct: in KHR.Surface_Protected_Capabilities)
        return Surface_Protected_Capabilities_C;
    procedure Free(Struct: in out Surface_Protected_Capabilities_C);

    -- Extension record conversion.
    function To_C(Next: in In_Structure_Access) return C.In_Structure_C_Access;
    procedure Free(Next: in out C.In_Structure_C_Access);
end Vulkan.Extensions.KHR_Surface_Protected_Capabilities_C;

