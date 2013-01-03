﻿// Copyright 2011 Max Toro Q.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Compilation;
using myxsl.net.web.compilation;

namespace myxsl.net.web {

   public static class PreApplicationStartCode {

      static bool startWasCalled;

      public static void Start() {

         if (!startWasCalled) {
            startWasCalled = true;
            BuildProvider.RegisterBuildProvider(".xsl", typeof(XsltPageBuildProvider));
            BuildProvider.RegisterBuildProvider(".xqy", typeof(XQueryPageBuildProvider));
            BuildProvider.RegisterBuildProvider(".sch", typeof(SchematronValidatorBuildProvider));
         }
      }
   }
}