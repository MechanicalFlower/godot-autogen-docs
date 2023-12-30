<dl class="py class">
    <dt class="sig sig-object py" id="template_engine.gd">
        <em class="property">
            <span class="pre">class</span>
            <span class="w"> </span>
        </em>
        <span class="sig-prename descclassname">
            <span class="pre">template_engine.gd</span>
        </span>
        <em class="property">
            <span class="w"> </span>
            <span class="pre">extends</span>
            <span class="w"> </span>
        </em>
        <span class="sig-prename descclassname">
            <span class="pre">[]</span>
        </span>
    </dt>
    <dd>
        <p></p>





        <dl class="py method">
            <dt class="sig sig-object py" id="replace_variable">
                <em class="property">
                    <span class="pre">static func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">replace_variable</span>
                </span>
            </dt>
            <p></p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>template</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>placeholder_key</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>value</strong> (<em>Variant</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>String</p>
                </dd>
            </dl>
        </dl>

        <dl class="py method">
            <dt class="sig sig-object py" id="render_dictionary">
                <em class="property">
                    <span class="pre">static func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">render_dictionary</span>
                </span>
            </dt>
            <p>Iterate through the keys in the dictionary and recursively replace placeholders</p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>template</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>placeholder_key</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>data</strong> (<em>Dictionary</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>String</p>
                </dd>
            </dl>
        </dl>

        <dl class="py method">
            <dt class="sig sig-object py" id="tokenize_template">
                <em class="property">
                    <span class="pre">static func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">tokenize_template</span>
                </span>
            </dt>
            <p>Tokenizes the template into individual elements for processing</p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>template</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>placeholder_key</strong> (<em>String</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>Array</p>
                </dd>
            </dl>
        </dl>

        <dl class="py method">
            <dt class="sig sig-object py" id="render_forloops">
                <em class="property">
                    <span class="pre">static func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">render_forloops</span>
                </span>
            </dt>
            <p>Renders for-loops in the template with the provided data</p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>template</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>data</strong> (<em>Dictionary</em>)</p>
                        </li>

                        <li>
                            <p><strong>placeholder_key</strong> (<em>String</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>String</p>
                </dd>
            </dl>
        </dl>

        <dl class="py method">
            <dt class="sig sig-object py" id="_render_forloops">
                <em class="property">
                    <span class="pre">static func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">_render_forloops</span>
                </span>
            </dt>
            <p></p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>template</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>data</strong> (<em>Dictionary</em>)</p>
                        </li>

                        <li>
                            <p><strong>forloops_block</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>data_key</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>loop_variable</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>loop_content</strong> (<em>String</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>String</p>
                </dd>
            </dl>
        </dl>

        <dl class="py method">
            <dt class="sig sig-object py" id="render_template">
                <em class="property">
                    <span class="pre">static func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">render_template</span>
                </span>
            </dt>
            <p>Define a static function to render a template with data</p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>template</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>data</strong> (<em>Dictionary</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>String</p>
                </dd>
            </dl>
        </dl>

    </dd>
</dl>
