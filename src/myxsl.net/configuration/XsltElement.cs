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
using System.Configuration;

namespace myxsl.configuration {
   
   sealed class XsltElement : ConfigurationElement {
      
      static readonly ConfigurationPropertyCollection _Properties;
      static readonly ConfigurationProperty _DefaultProcessor;

      static XsltElement() {

         _DefaultProcessor = new ConfigurationProperty("defaultProcessor", typeof(String), null, null, new StringValidator(1), ConfigurationPropertyOptions.None);

         _Properties = new ConfigurationPropertyCollection { 
            _DefaultProcessor
         };
      }

      protected override ConfigurationPropertyCollection Properties {
         get { return _Properties; }
      }

      public string DefaultProcessor {
         get { return (string)this[_DefaultProcessor]; }
         internal set { this[_DefaultProcessor] = value; }
      }
   }
}
